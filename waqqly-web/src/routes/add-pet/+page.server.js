import { API_URL } from "$env/static/private";
export const actions = {
  registerPet: async ({ request }) => {
    const receivedFormData = await request.formData();
    let tmpObject = {};
    receivedFormData.forEach((value, key) => (tmpObject[key] = value));
    let formattedData = JSON.stringify(tmpObject);

    console.log(formattedData);

    fetch(`${API_URL}/post-pets`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: formattedData,
    });
  },
};
