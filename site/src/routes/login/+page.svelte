<script>
	import { goto } from '$app/navigation';

	let apiKey = $state('');
	let serverUrl = $state('');

	function connect() {
		localStorage.setItem('serverUrl', serverUrl);
		localStorage.setItem('token', apiKey);
		goto('/machines');
	}
</script>

<div class="flex min-h-screen items-center justify-center bg-black p-4">
	<div class="w-full max-w-md">
		<h1 class="mb-2 text-center text-3xl font-bold text-white">Welcome</h1>
		<p class="mb-8 text-center text-sm text-neutral-400">
			Enter the api key and the server url to proceed with the install. You can generate the api
			keys with <code class="rounded bg-neutral-800 px-1.5 py-0.5 text-neutral-200"
				>headscale apikeys create</code
			>
		</p>
		<form
			class="space-y-4"
			onsubmit={(e) => {
				e.preventDefault();
				connect();
			}}
		>
			<div>
				<label for="server-url" class="mb-1 block text-sm font-medium text-neutral-300"
					>Server URL</label
				>
				<input
					id="server-url"
					type="url"
					bind:value={serverUrl}
					placeholder="https://headscale.example.com"
					class="w-full rounded-lg border border-neutral-700 bg-neutral-900 px-4 py-2 text-sm text-white placeholder:text-neutral-500 focus:border-sky-300 focus:outline-none"
				/>
			</div>

			<div>
				<label for="api-key" class="mb-1 block text-sm font-medium text-neutral-300">API Key</label>
				<input
					id="api-key"
					type="password"
					bind:value={apiKey}
					placeholder="••••••••••••••••"
					class="w-full rounded-lg border border-neutral-700 bg-neutral-900 px-4 py-2 text-sm text-white placeholder:text-neutral-500 focus:border-sky-300 focus:outline-none"
				/>
			</div>

			<button
				type="submit"
				class="w-full rounded-lg bg-sky-300 px-4 py-2 text-sm font-semibold text-black transition hover:bg-sky-200 focus:ring-2 focus:ring-sky-300 focus:outline-none"
			>
				Connect
			</button>
		</form>
	</div>
</div>
