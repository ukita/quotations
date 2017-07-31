import React, { Component } from 'react'
import Yesterday from './yesterday'
import Month from './month'
import Week from './week'

class Chart extends Component {
  render() {
    const {currency} = this.props

    return (
      <div>
        <Yesterday currency={currency}/>
        <Week currency={currency} />
        <Month currency={currency} />
      </div>
    )
  }
}

export default Chart
