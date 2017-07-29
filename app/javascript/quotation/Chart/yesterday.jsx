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
  

  render() {
    const {quotations} = this.state 

    return (
      <div>
        <p>Quotations from yesterday</p>
        {quotations && <LineChart width={400} height={400} data={this.prepareQuotations(quotations)}>
          <Line type="monotone" dataKey="sell" stroke="#8884d8" />
          <Line type="monotone" dataKey="buy" stroke="#8884d8" />
          <XAxis dataKey="created_at"/>
          <YAxis/>
        </LineChart>}
      </div>
    )
  }
}

export default Yesterday
