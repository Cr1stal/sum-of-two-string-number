def op_plus(a, b, add1)
  case a
  when '0'
    case b
    when '0'
      if add1
        [false, '1']
      else
        [false, '0']
      end
    when '1'
      if add1
        [true, '0']
      else
        [false, '1']
      end
    else
      raise 'not b'
    end
  when '1'
    case b
    when '0'
      if add1
        [true, '0']
      else
        [false, '1']
      end
    when '1'
      if add1
        [true, '1']
      else
        [true, '0']
      end
    else
      raise 'not b'
    end
  end
end

def sum(a, b)
  def iter(c, d, add1)
    if add1
      return iter(add1 ? '1' : '0', d, false) if c.length == 0
      return iter(c, add1 ? '1' : '0', false) if d.length == 0
    else
      return d if c.length == 0
      return c if d.length == 0
    end

    result = op_plus(c[0], d[0], add1)
    result[1] + iter(c[1..-1], d[1..-1], result[0])
  end

  iter(a.reverse, b.reverse, false).reverse
end

describe "summator" do
  it "sums('0', '0') = '0'" do
    expect(sum('0', '0')).to eq('0')
  end
  it "sums('0', '1') = '1'" do
    expect(sum('0', '1')).to eq('1')
  end
  it "sums('1', '0') = '1'" do
    expect(sum('1', '0')).to eq('1')
  end
  it "sums('1', '1') = '10'" do
    expect(sum('1', '1')).to eq('10')
  end
  it "sums('10', '1') = '11'" do
    expect(sum('10', '1')).to eq('11')
  end
  it "sums('10', '10') = '100'" do
    expect(sum('10', '10')).to eq('100')
  end
  it "sums('11', '11') = '110'" do
    expect(sum('11', '11')).to eq('110')
  end
  it "sums('11', '1') = '100'" do
    expect(sum('11', '1')).to eq('100')
  end
  it "sums('1', '11') = '100'" do
    expect(sum('1', '11')).to eq('100')
  end
  it "sums('1000', '1') = '1001'" do
    expect(sum('1000', '1')).to eq('1001')
  end
  it "sums('1000', '1000') = '10000'" do
    expect(sum('1000', '1000')).to eq('10000')
  end
end
