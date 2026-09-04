<script>
	/** @type {Array<{name: string}>} */
	let users = $state([]);
	let error = $state('');

	$effect(() => {
		const serverUrl = localStorage.getItem('serverUrl');
		const token = localStorage.getItem('token');

		fetch(`${serverUrl}/api/v1/user`, {
			headers: { Authorization: `Bearer ${token}` }
		})
			.then((res) => {
				if (!res.ok) throw new Error(`Request failed: ${res.status}`);
				return res.json();
			})
			.then((data) => {
				users = data.users;
			})
			.catch((e) => {
				error = e.message;
			});
	});
</script>

<ul>
	{#each users as user}
		<li>{user.name}</li>
	{:else}
		<li>{error || 'Loading users...'}</li>
	{/each}
</ul>
