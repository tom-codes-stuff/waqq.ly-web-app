import { API_URL } from "$env/static/private";
export async function load({ fetch }) {
  const response = await fetch(`${API_URL}/get-pets`);

  return {
    pets: await response.json(),
  };
}
