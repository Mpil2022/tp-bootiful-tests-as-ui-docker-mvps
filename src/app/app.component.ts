import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent implements OnInit {
  private _num: number;

  constructor(private _http: HttpClient) {
    this._num = 0;
  }

  ngOnInit(): void {
    this._http
      .get(environment.API_BASE_URL + 'adder/current')
      .subscribe((res) => {
        this._num = res as number;
      });
  }

  add(i: string) {
    if (Number(i) != 0) {
      this._http
        .get(environment.API_BASE_URL + 'adder/add/' + i)
        .subscribe(() => {
          this._num = this._num + Number(i);
        });
    }
  }

  get num(): number {
    return this._num;
  }
}
