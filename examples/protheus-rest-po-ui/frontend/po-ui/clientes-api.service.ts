import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';

export interface Cliente {
  id: string;
  codigo: string;
  loja: string;
  nome: string;
  documento: string;
  ativo: boolean;
}

export interface ClienteListResponse {
  items: Cliente[];
  hasNext: boolean;
  page: number;
  pageSize: number;
  total: number;
}

@Injectable({ providedIn: 'root' })
export class ClientesApiService {
  private readonly http = inject(HttpClient);
  private readonly baseUrl = '/api/clientes';

  list(page = 1, pageSize = 20, search = ''): Observable<ClienteListResponse> {
    let params = new HttpParams()
      .set('page', String(page))
      .set('pageSize', String(pageSize));

    if (search.trim()) {
      params = params.set('search', search.trim());
    }

    return this.http.get<ClienteListResponse>(this.baseUrl, { params });
  }

  getById(id: string): Observable<Cliente> {
    return this.http.get<Cliente>(`${this.baseUrl}/${encodeURIComponent(id)}`);
  }

  create(payload: Omit<Cliente, 'id'>): Observable<Cliente> {
    return this.http.post<Cliente>(this.baseUrl, payload);
  }

  update(id: string, payload: Omit<Cliente, 'id'>): Observable<Cliente> {
    return this.http.put<Cliente>(`${this.baseUrl}/${encodeURIComponent(id)}`, payload);
  }
}
