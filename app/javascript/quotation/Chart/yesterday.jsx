import React, { Component } from 'react'
import {LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend} from 'recharts'
import moment from 'moment'

class Yesterday extends Component {
  constructor(props) {
    super(props)
    this.state = {quotations: null}
    this.fetchQuotations = this.fetchQuotations.bind(this)
  }

  componentDidMount() {
    this.fetchQuotations()
  }

  componentWillReceiveProps(nextProps) {
    this.props = nextProps
    this.fetchQuotations()
  }

  fetchQuotations() {
    const {currency} = this.props
    fetch(`/api/currencies/${currency.id}/quotations/from_yesterday`)
      .then(res => res.json())
      .then(json => this.setState({quotations: json}))
  }

  prepareQuotations(quotations) {
    return quotations.map((quotation) => {
      quotation.created_at = moment(quotation.created_at).format('H:mm')
      return quotation
    })
  }

  renderTooltip({payload}) {
    if(payload.length != 0){
      return (
        <div className="custom-tooltip">
          <p className="label">{`${payload[0].payload.buy}`}</p>
        </div>
      )
    }
  }

  render() {
    const {quotations} = this.state 

    return (
      <div>
        <p>Quotations from yesterday</p>
        {quotations && <LineChart width={1200} height={400} data={this.prepareQuotations(quotations)}>
          <Line type="monotone" dataKey="variation" stroke="#66ddd8" />
          <Tooltip />
          <XAxis interval={0} dataKey="created_at"/>
          <YAxis/>
        </LineChart>}
      </div>
    )
  }
}

export default Yesterday
