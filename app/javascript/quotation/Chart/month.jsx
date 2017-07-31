import React, { Component } from 'react'
import {LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend} from 'recharts'
import moment from 'moment'

class Month extends Component {
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
    fetch(`/api/currencies/${currency.id}/quotations/from_last_month`)
      .then(res => res.json())
      .then(json => this.setState({quotations: json}))
  }

  prepareQuotations(quotations) {
    return quotations.map((quotation) => {
      quotation.created_at = moment(quotation.created_at).format('DD')
      return quotation
    })
  }
  

  render() {
    const {quotations} = this.state 

    return (
      <div>
        <p>Quotations from last month</p>
        {quotations && <LineChart width={1200} height={400} data={this.prepareQuotations(quotations)}>
          <Line type="monotone" dataKey="variation" stroke="#8884d8" />
          <Tooltip/>
          <XAxis interval={0} dataKey="created_at"/>
          <YAxis/>
        </LineChart>}
      </div>
    )
  }
}

export default Month
