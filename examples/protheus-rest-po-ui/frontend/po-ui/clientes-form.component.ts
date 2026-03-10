import { Component, OnInit, inject } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PoDynamicFormField, PoNotificationService } from '@po-ui/ng-components';
import { ClientesApiService } from './clientes-api.service';

@Component({
  selector: 'app-clientes-form',
  template: `
    <po-page-default p-title="Cadastro de cliente">
      <po-dynamic-form
        [p-fields]="fields"
        [p-value]="value"
        (p-submit)="save($event)">
      </po-dynamic-form>
    </po-page-default>
  `,
})
export class ClientesFormComponent implements OnInit {
  private readonly api = inject(ClientesApiService);
  private readonly route = inject(ActivatedRoute);
  private readonly notification = inject(PoNotificationService);

  readonly fields: PoDynamicFormField[] = [
    { property: 'codigo', label: 'Codigo', required: true },
    { property: 'loja', label: 'Loja', required: true },
    { property: 'nome', label: 'Nome', required: true },
    { property: 'nomeReduzido', label: 'Nome Reduzido', required: true },
    {
      property: 'tipo',
      label: 'Tipo',
      required: true,
      options: [
        { label: 'Consumidor final', value: 'F' },
        { label: 'Revenda', value: 'R' },
      ],
    },
    {
      property: 'pessoa',
      label: 'Pessoa',
      required: true,
      options: [
        { label: 'Fisica', value: 'F' },
        { label: 'Juridica', value: 'J' },
      ],
    },
    { property: 'documento', label: 'Documento' },
    { property: 'inscricao', label: 'Inscricao Estadual' },
    { property: 'endereco', label: 'Endereco', required: true },
    { property: 'bairro', label: 'Bairro', required: true },
    { property: 'municipio', label: 'Municipio', required: true },
    { property: 'estado', label: 'UF', required: true, minLength: 2, maxLength: 2 },
    { property: 'cep', label: 'CEP' },
    { property: 'ddd', label: 'DDD' },
    { property: 'telefone', label: 'Telefone' },
    { property: 'email', label: 'E-mail' },
    { property: 'ativo', label: 'Ativo', boolean: true },
  ];

  clienteId = '';
  value: Record<string, unknown> = {
    tipo: 'F',
    pessoa: 'J',
    ativo: true,
  };

  ngOnInit(): void {
    this.clienteId = this.route.snapshot.paramMap.get('id') ?? '';

    if (this.clienteId) {
      this.api.getById(this.clienteId).subscribe({
        next: cliente => {
          this.value = cliente;
        },
        error: () => {
          this.notification.error('Nao foi possivel carregar o cliente');
        },
      });
    }
  }

  save(value: Record<string, unknown>): void {
    const request$ = this.clienteId
      ? this.api.update(this.clienteId, value as never)
      : this.api.create(value as never);

    request$.subscribe({
      next: () => {
        this.notification.success('Cliente salvo com sucesso');
      },
      error: () => {
        this.notification.error('Nao foi possivel salvar o cliente');
      },
    });
  }
}
