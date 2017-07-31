import React, { Component } from 'react'
import {LineChart, Line, XAxis, YAxis, ResponsiveContainer, Tooltip} from 'recharts'
import moment from 'moment'

class Week extends Component {
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
    fetch(`/api/currencies/${currency.id}/quotations/from_last_week`)
      .then(res => res.json())
      .then(json => this.setState({quotations: json}))
  }

  prepareQuotations(quotations) {
    return quotations.map((quotation) => {
      quotation.created_at = moment(quotation.created_at).format('ddd')
      return quotation
    })
  }
  

  render() {
    const {quotations} = this.state 

    return (
      <div className="panel panel-default">
        <div className="panel-heading">Quotations from last week</div>
        <div className="panel-body">
          {quotations && 
          <ResponsiveContainer width="100%" height={500}>
            <LineChart data={this.prepareQuotations(quotations)}>
              <Line type="monotone" dataKey="variation" stroke="#8e44ad" />
              <Tooltip />
              <XAxis interval={0} dataKey="created_at"/>
              <YAxis/>
            </LineChart>
          </ResponsiveContainer>
          }
        </div>
      </div>
    )
  }
}

export default Week
