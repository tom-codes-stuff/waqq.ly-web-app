import { API_URL } from "$env/static/private";
export const actions = {
  registerWalker: async ({ request }) => {
    const receivedFormData = await request.formData();
    let tmpObject = {};
    receivedFormData.forEach((value, key) => (tmpObject[key] = value));
    let formattedData = JSON.stringify(tmpObject);

    console.log(formattedData);

    fetch(`${API_URL}/post-walkers`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: formattedData,
    });
  },
};
