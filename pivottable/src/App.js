import logo from './logo.svg';
import './App.css';
import { PivotViewComponent } from '@syncfusion/ej2-react-pivotview';
import { DataManager, WebApiAdaptor, Query } from '@syncfusion/ej2-data';
import * as React from 'react';
import * as ReactDOM from 'react-dom';
export default class App extends React.Component {
    constructor() {
        super(...arguments);
        this.dataSource = new DataManager({
            url: 'https://bi.syncfusion.com/northwindservice/api/orders',
            adaptor: new WebApiAdaptor,
            crossDomain: true
        }).executeQuery(new Query().take(8)).then((e) => {
            this.pivotObj.dataSourceSettings = {
                dataSource: e.result,
                expandAll: true,
                filters: [],
                columns: [{ name: 'ProductName', caption: 'Product Name' }],
                rows: [{ name: 'ShipCountry', caption: 'Ship Country' }, { name: 'ShipCity', caption: 'Ship City' }],
                formatSettings: [{ name: 'UnitPrice', format: 'C0' }],
                values: [{ name: 'Quantity' }, { name: 'UnitPrice', caption: 'Unit Price' }]
            };
        });
    }
    render() {
        return <PivotViewComponent ref={d => this.pivotObj = d} id='PivotView' height={350} dataSourceSettings={this.dataSourceSettings}></PivotViewComponent>;
    }
  }