export const FETCH_MESSAGES = 'FETCH_MESSAGES';
export const MESSAGE_POSTED = 'MESSAGE_POSTED';
export const CHANNEL_SELECTED = 'CHANNEL_SELECTED';
const BASE_URL = '/api/v1';

export function fetchMessages(channel) {
  const url = `${BASE_URL}/channels/${channel}/messages`;
  const promise = fetch(url, { credentials: 'same-origin' })
    .then(r => r.json());
  return {
    type: FETCH_MESSAGES,
    payload: promise // Will be resolved by redux-promise
  };
}

export function createMessage(channel, content) {
  const url = `${BASE_URL}/channels/${channel}/messages`;
  const csrfToken = document.querySelector('meta[name="csrf-token"]').attributes.content.value;
  const body = { content }; // ES6 destructuring
  const promise = fetch(url, {
    method: 'POST',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
      'X-CSRF-Token': csrfToken
    },
    body: JSON.stringify(body),
    credentials: 'same-origin'
  }).then(r => r.json());

  return {
    type: MESSAGE_POSTED,
    payload: promise // Will be resolved by redux-promise
  };
}

export function selectChannel() {
  return {
    type: CHANNEL_SELECTED,
  };
}
