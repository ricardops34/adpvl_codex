import { Component, OnInit, inject } from '@angular/core';
import { PoNotificationService, PoPageAction, PoTableColumn } from '@po-ui/ng-components';
import { ClientesApiService, Cliente } from './clientes-api.service';

@Component({
  selector: 'app-clientes-list',
  template: `
    <po-page-default p-title="Clientes" [p-actions]="actions">
      <po-table
        [p-columns]="columns"
        [p-items]="items">
      </po-table>
    </po-page-default>
  `,
})
export class ClientesListComponent implements OnInit {
  private readonly api = inject(ClientesApiService);
  private readonly notification = inject(PoNotificationService);

  readonly actions: PoPageAction[] = [
    { label: 'Novo cliente', action: () => this.onCreate() },
  ];

  readonly columns: PoTableColumn[] = [
    { property: 'codigo', label: 'Codigo' },
    { property: 'loja', label: 'Loja' },
    { property: 'nome', label: 'Nome' },
    { property: 'nomeReduzido', label: 'Nome Reduzido' },
    { property: 'documento', label: 'Documento' },
    { property: 'municipio', label: 'Municipio' },
    { property: 'estado', label: 'UF' },
  ];

  items: Cliente[] = [];

  ngOnInit(): void {
    this.loadItems();
  }

  private loadItems(): void {
    this.api.list().subscribe({
      next: response => {
        this.items = response.items;
      },
      error: () => {
        this.notification.error('Nao foi possivel carregar os clientes');
      },
    });
  }

  private onCreate(): void {
    this.notification.information('Redirecione para a tela de formulario do projeto');
  }
}
