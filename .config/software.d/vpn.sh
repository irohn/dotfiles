
# mullvad VPN
command -v mullvad > /dev/null 2>&1 && \
  alias vpn='mullvad' && \
  mullvad=true


connect() {
  local country_code=$(mullvad relay list | awk '/^[[:upper:]]/' | fzf --exact --query ${1:-""} --select-1 | sed -E -n 's/.*\((.*)\).*$/\1/p')
  local city_code=${2:-""}
  mullvad relay set location $country_code $city_code
}
