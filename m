Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3568701DE
	for <lists+nouveau@lfdr.de>; Mon,  4 Mar 2024 13:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2C611210D;
	Mon,  4 Mar 2024 12:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Q/GjkFiJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0145611210D
 for <nouveau@lists.freedesktop.org>; Mon,  4 Mar 2024 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709557077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eYaZySGsjz3Z9Hut7oWV6qGRb0bgLyHNoQ/FkIP7nYU=;
 b=Q/GjkFiJvjOyTXl8viE9ssF9Dk7KnfzY0CA035gj08XWpY0JAGhDZ021JQFt/WSGWydfRu
 OEsQhhZ+lnjWvnKfKTJ4QXqaR+PKwYyrbiAb6hhwjowULqHQc3p6ts9Px8yRqqzZd0tpDV
 zts3HFmA2hv8+UuymnRQ4WvS+oH5NnQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-CHIAs4TlNTSTnqrXMy-s1Q-1; Mon, 04 Mar 2024 07:57:56 -0500
X-MC-Unique: CHIAs4TlNTSTnqrXMy-s1Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a44508b6b22so242766366b.2
 for <nouveau@lists.freedesktop.org>; Mon, 04 Mar 2024 04:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709557075; x=1710161875;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eYaZySGsjz3Z9Hut7oWV6qGRb0bgLyHNoQ/FkIP7nYU=;
 b=OGsNGSgqYeddPEuO0MwUreJqS1ISClOIEMBkcQBbRa7rurNOTw3wGvmQhVbIUTC43R
 1D+JETJXMBduoeQRdvocQnb1DzvYYjl6IVBXSyWwWwvSqk9oKuC431zjsZq47y9WYTJj
 nW0w0NBBPVwQgRVD9q6AZU+hN7lfNzK+rYU2L4N40JzYihU+kjoQdNTMmRrjuzoHtTzB
 Do7FpdadsDK6raMu+fC4XWN8/cV5+Styr4uGtQAPxI1WvUMApQqv8CddTU191PyYbEd1
 y6xilhlrBaJHzXouDge1la14bZN+siiwjszEBAh3MVJDRB184N3btl8Em6wk3pDcJiWs
 YzTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBB500O8ylnJkT6E0H2/18hin6cyIgZUQ7mH6LACYKN/wnsv8NoCx46rkGSkYaMf75zpK0jUBZDunEJaSLjO3/OSXvZCVync2nQvwhzA==
X-Gm-Message-State: AOJu0Yy9Qr7IQ/S8ne9QZTFGHSKg9wqocGHlfW5T42qzvH1UBuRbM8dw
 Aowq9Wj7hlp/UcP4OTB3r8jnsawSoKh9T6N3xOOYqJULo6gJaoAqXG0LGVpL8YNGlYK9sftexy0
 X7eTIRda7rwYDtGmu24SnY3PDsHRf9lt50bVtBEs6PlFJEDnOt2O6Wdkn2BQ30Uo=
X-Received: by 2002:a05:6402:1d21:b0:566:981d:aef5 with SMTP id
 dh1-20020a0564021d2100b00566981daef5mr5593476edb.24.1709557075014; 
 Mon, 04 Mar 2024 04:57:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnTXigaoslZLLczHin2gXZc+I/5AV1i/e1RrtKcgzGCCOqC57oXW8SZB4FiOwgM2i07rgEBQ==
X-Received: by 2002:a05:6402:1d21:b0:566:981d:aef5 with SMTP id
 dh1-20020a0564021d2100b00566981daef5mr5593457edb.24.1709557074592; 
 Mon, 04 Mar 2024 04:57:54 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 cq16-20020a056402221000b005672a346a8fsm1814031edb.57.2024.03.04.04.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 04:57:54 -0800 (PST)
Message-ID: <7eb28bbf-76aa-4f97-b426-f0d87c4d2d7a@redhat.com>
Date: Mon, 4 Mar 2024 13:57:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v4] nouveau: add command-line GSP-RM registry support
To: Timur Tabi <ttabi@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
References: <20240220215805.3201094-1-ttabi@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240220215805.3201094-1-ttabi@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2/20/24 22:58, Timur Tabi wrote:
> Add the NVreg_RegistryDwords command line parameter, which allows
> specifying additional registry keys to be sent to GSP-RM.  This
> allows additional configuration, debugging, and experimentation
> with GSP-RM, which uses these keys to alter its behavior.
> 
> Note that these keys are passed as-is to GSP-RM, and Nouveau does
> not parse them.  This is in contrast to the Nvidia driver, which may
> parse some of the keys to configure some functionality in concert with
> GSP-RM.  Therefore, any keys which also require action by the driver
> may not function correctly when passed by Nouveau.  Caveat emptor.
> 
> The name and format of NVreg_RegistryDwords is the same as used by
> the Nvidia driver, to maintain compatibility.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Thanks for sending a new version of the patch.

Please make sure that for future patches you include a changelog, such that
it's easier for reviewers to keep track of what has changed.

> ---
>   .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |   6 +
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 375 ++++++++++++++++--
>   2 files changed, 357 insertions(+), 24 deletions(-)

There are a few issues pointed out by checkpatch.pl, that I think should be fixed.
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index 6f5d376d8fcc..3fbc57b16a05 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -211,6 +211,12 @@ struct nvkm_gsp {
>   		struct mutex mutex;;
>   		struct idr idr;
>   	} client_id;
> +
> +	/* A linked list of registry items. The registry RPC will be built from it. */
> +	struct list_head registry_list;
> +
> +	/* The size of the registry RPC */
> +	size_t registry_rpc_size;
>   };
>   
>   static inline bool
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 1c46e3f919be..40757a21e150 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -54,6 +54,8 @@
>   #include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
>   
>   #include <linux/acpi.h>
> +#include <linux/ctype.h>
> +#include <linux/parser.h>
>   
>   #define GSP_MSG_MIN_SIZE GSP_PAGE_SIZE
>   #define GSP_MSG_MAX_SIZE GSP_PAGE_MIN_SIZE * 16
> @@ -1082,51 +1084,376 @@ r535_gsp_rpc_unloading_guest_driver(struct nvkm_gsp *gsp, bool suspend)
>   	return nvkm_gsp_rpc_wr(gsp, rpc, true);
>   }
>   
> +enum registry_type {
> +	REGISTRY_TABLE_ENTRY_TYPE_DWORD  = 1, /* 32-bit unsigned integer */
> +	REGISTRY_TABLE_ENTRY_TYPE_BINARY = 2, /* Binary blob */
> +	REGISTRY_TABLE_ENTRY_TYPE_STRING = 3, /* Null-terminated string */
> +};
> +
> +/**
> + * registry_list_entry - linked list member for a registry key/value
> + * @head: list_head struct
> + * @type: dword, binary, or string
> + * @klen: the length of name of the key
> + * @vlen: the length of the value
> + * @v.dword: the data, if REGISTRY_TABLE_ENTRY_TYPE_DWORD
> + * @v.binary: the data, if TYPE_BINARY or TYPE_STRING
> + * @key: the key name
> + *
> + * Every registry key/value is represented internally by this struct.
> + *
> + * Type DWORD is a simple 32-bit unsigned integer, and its value is stored in
> + * v.dword.
> + *
> + * Types BINARY and STRING are variable-length binary blobs.  The only real
> + * difference between BINARY and STRING is that STRING is null-terminated and
> + * is expected to contain only printable characters.
> + *
> + * To avoid having to kmalloc multiple objects, the value for BINARY and
> + * STRING is appended after the key[] in memory, and v.binary just points to
> + * that block.
> + *
> + * Note: it is technically possible to have multiple keys with the same name
> + * but different types, but this is not useful since GSP-RM expects keys to
> + * have only one specific type.
> + */
> +struct registry_list_entry {
> +	struct list_head head;
> +	enum registry_type type;
> +	size_t klen;
> +	size_t vlen;
> +	union {
> +		u32 dword;	/* TYPE_DWORD */
> +		void *binary;	/* TYPE_BINARY or TYPE_STRING */
> +	} v;
> +	char key[] __counted_by(klen);
> +};
> +
> +/**
> + * add_registry -- adds a registry entry
> + * @gsp: gsp pointer
> + * @key: name of the registry key
> + * @type: type of data
> + * @data: pointer to value
> + * @length: size of data, in bytes
> + *
> + * Adds a registry key/value pair to the registry database.
> + *
> + * This function collects the registry information in a linked list.  After
> + * all registry keys have been added, build_registry() is used to create the
> + * RPC data structure.
> + *
> + * registry_rpc_size is a running total of the size of all registry keys.
> + * It's used to avoid an O(n) calculation of the size when the RPC is built.
> + *
> + * Returns 0 on success, or negative error code on error.
> + */
> +static int add_registry(struct nvkm_gsp *gsp, const char *key,
> +			enum registry_type type, const void *data, size_t length)
> +{
> +	struct registry_list_entry *reg;
> +	size_t nlen = strlen(key) + 1;
> +	size_t vlen; /* value length, non-zero if binary or string */
> +
> +	/* Set an arbitrary limit to avoid problems with broken command lines */
> +	if (nlen > 64)
> +		return -EFBIG;
> +
> +	vlen = (type == REGISTRY_TABLE_ENTRY_TYPE_DWORD) ? 0 : length;
> +
> +	reg = kmalloc(sizeof(struct registry_list_entry) + nlen + vlen, GFP_KERNEL);
> +	if (!reg)
> +		return -ENOMEM;
> +
> +	switch (type) {
> +	case REGISTRY_TABLE_ENTRY_TYPE_DWORD:
> +		reg->v.dword = *(const u32 *)(data);
> +		nvkm_debug(&gsp->subdev, "adding GSP-RM registry '%s=%u'\n",
> +			   key, reg->v.dword);
> +		break;
> +	case REGISTRY_TABLE_ENTRY_TYPE_BINARY:
> +	case REGISTRY_TABLE_ENTRY_TYPE_STRING:
> +		reg->v.binary = (void *)&reg->key + nlen;

I see, you just append the binary at the end of the struct. However, that messes with
the __counted_by() of reg->key. I think we should do a separate allocation for binary
and string types.

> +		memcpy(reg->v.binary, data, length);
> +		vlen = length;
> +		if (type == REGISTRY_TABLE_ENTRY_TYPE_BINARY)

If you want a debug print for each type, you could move them to a separate function with
it's own switch case.

> +			nvkm_debug(&gsp->subdev,
> +				   "adding GSP-RM registry '%s' blob of %zu bytes\n",
> +				   key, length);
> +		else
> +			nvkm_debug(&gsp->subdev,
> +				   "adding GSP-RM registry string '%s=%s'\n",
> +				   key, (char *)reg->v.binary);
> +		break;
> +	default:
> +		nvkm_error(&gsp->subdev, "unrecognized registry type %u for '%s'\n",
> +			   type, key);
> +		kfree(reg);
> +		return -EINVAL;
> +	}
> +
> +	memcpy(reg->key, key, nlen);
> +	reg->klen = nlen;
> +	reg->vlen = length;
> +	reg->type = type;
> +
> +	list_add_tail(&reg->head, &gsp->registry_list);
> +	gsp->registry_rpc_size += sizeof(PACKED_REGISTRY_ENTRY) + nlen + vlen;
> +
> +	return 0;
> +}
> +
> +static int add_registry_num(struct nvkm_gsp *gsp, const char *key, u32 value)
> +{
> +	return add_registry(gsp, key, REGISTRY_TABLE_ENTRY_TYPE_DWORD,
> +			    &value, sizeof(u32));
> +}
> +
> +static int add_registry_string(struct nvkm_gsp *gsp, const char *key, const char *value)
> +{
> +	return add_registry(gsp, key, REGISTRY_TABLE_ENTRY_TYPE_STRING,
> +			    value, strlen(value) + 1);
> +}
> +
> +
> +/**
> + * build_registry -- create the registry RPC data
> + * @gsp: gsp pointer
> + * @registry: pointer to the RPC payload to fill
> + *
> + * After all registry key/value pairs have been added, call this function to
> + * build the RPC.
> + *
> + * The registry RPC looks like this:
> + *
> + * +-----------------+
> + * |NvU32 size;      |
> + * |NvU32 numEntries;|
> + * +-----------------+
> + * +---------------------+
> + * |PACKED_REGISTRY_ENTRY|
> + * +---------------------+
> + * |PACKED_REGISTRY_ENTRY|
> + * +---------------------+
> + * ... (one copy for each entry)
> + *
> + * +----------------------------------------+
> + * |Null-terminated key (string) for entry 0|
> + * +----------------------------------------+
> + * |Binary/string data value for entry 0    | (only if necessary)
> + * +----------------------------------------+
> + * |Null-terminated key (string) for entry 1|
> + * +----------------------------------------+
> + * |Binary/string data value for entry 1    | (only if necessary)
> + * +----------------------------------------+
> + * ... (one copy for each entry)
> + *
> + *
> + * The 'data' field of an entry is either a 32-bit integer (for type DWORD)
> + * or an offset into the PACKED_REGISTRY_TABLE (for types BINARY and STRING).
> + *
> + * All memory allocated by add_registry() is released.
> + */
> +static void build_registry(struct nvkm_gsp *gsp, PACKED_REGISTRY_TABLE *registry)
> +{
> +	struct registry_list_entry *reg, *n;
> +	size_t str_offset;
> +	unsigned int i = 0;
> +
> +	registry->numEntries = list_count_nodes(&gsp->registry_list);
> +	str_offset = struct_size(registry, entries, registry->numEntries);
> +
> +	list_for_each_entry_safe(reg, n, &gsp->registry_list, head) {
> +		registry->entries[i].type = reg->type;
> +		registry->entries[i].length = reg->klen;
> +
> +		/* Copy the key name to the table */
> +		registry->entries[i].nameOffset = str_offset;
> +		memcpy((void *)registry + str_offset, reg->key, reg->klen);
> +		str_offset += reg->klen;
> +
> +		switch (reg->type) {
> +		case REGISTRY_TABLE_ENTRY_TYPE_DWORD:
> +			registry->entries[i].data = reg->v.dword;
> +			break;
> +		case REGISTRY_TABLE_ENTRY_TYPE_BINARY:
> +		case REGISTRY_TABLE_ENTRY_TYPE_STRING:
> +			/* If the type is binary or string, copy the value */
> +			memcpy((void *)registry + str_offset, reg->v.binary, reg->vlen);
> +			registry->entries[i].data = str_offset;
> +			str_offset += reg->vlen;
> +			break;
> +		default:
> +		}
> +
> +		i++;
> +		list_del(&reg->head);
> +		kfree(reg);
> +	}
> +
> +	/* Double-check that we calculated the sizes correctly */
> +	WARN_ON(gsp->registry_rpc_size != str_offset);
> +
> +	registry->size = gsp->registry_rpc_size;
> +}
> +
> +/**
> + * clean_registry -- clean up registry memory in case of error
> + * @gsp: gsp pointer
> + *
> + * Call this function to clean up all memory allocated by add_registry()
> + * in case of error and build_registry() is not called.
> + */
> +static void clean_registry(struct nvkm_gsp *gsp)
> +{
> +	struct registry_list_entry *reg, *n;
> +
> +	list_for_each_entry_safe(reg, n, &gsp->registry_list, head) {
> +		list_del(&reg->head);
> +		kfree(reg);
> +	}
> +
> +	gsp->registry_rpc_size = sizeof(PACKED_REGISTRY_TABLE);
> +}
> +
> +MODULE_PARM_DESC(NVreg_RegistryDwords,
> +		 "A semicolon-separated list of key=integer pairs of GSP-RM registry keys");
> +static char *NVreg_RegistryDwords;
> +module_param(NVreg_RegistryDwords, charp, 0400);
> +
>   /* dword only */
>   struct nv_gsp_registry_entries {
>   	const char *name;
>   	u32 value;
>   };
>   
> +/**
> + * r535_registry_entries - required registry entries for GSP-RM
> + *
> + * This array lists registry entries that are required for GSP-RM to
> + * function correctly.
> + *
> + * RMSecBusResetEnable - enables PCI secondary bus reset
> + * RMForcePcieConfigSave - forces GSP-RM to preserve PCI configuration
> + *   registers on any PCI reset.
> + */
>   static const struct nv_gsp_registry_entries r535_registry_entries[] = {
>   	{ "RMSecBusResetEnable", 1 },
>   	{ "RMForcePcieConfigSave", 1 },
>   };
>   #define NV_GSP_REG_NUM_ENTRIES ARRAY_SIZE(r535_registry_entries)
>   
> +/**
> + * strip - strips all characters in 'reject' from 's'
> + * @s: string to strip
> + * @reject: string of characters to remove
> + *
> + * 's' is modified.
> + *
> + * Returns the length of the new string.
> + */
> +static size_t strip(char *s, const char *reject)
> +{
> +	char *p = s, *p2 = s;
> +	size_t length = 0;
> +	char c;
> +
> +	do {
> +		while ((c = *p2) && strchr(reject, c))
> +			p2++;
> +
> +		*p++ = c = *p2++;
> +		length++;
> +	} while (c);
> +
> +	return length;
> +}
> +
> +/**
> + * r535_gsp_rpc_set_registry - build registry RPC and call GSP-RM
> + * @gsp: gsp pointer
> + *
> + * The GSP-RM registry is a set of key/value pairs that configure some aspects
> + * of GSP-RM. The keys are strings, and the values are 32-bit integers.
> + *
> + * The registry is built from a combination of a static hard-coded list (see
> + * above) and entries passed on the driver's command line.
> + */
>   static int
>   r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
>   {
>   	PACKED_REGISTRY_TABLE *rpc;
> -	char *strings;
> -	int str_offset;
> -	int i;
> -	size_t rpc_size = struct_size(rpc, entries, NV_GSP_REG_NUM_ENTRIES);
> +	unsigned int i;
> +	int ret;
>   
> -	/* add strings + null terminator */
> -	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++)
> -		rpc_size += strlen(r535_registry_entries[i].name) + 1;
> +	INIT_LIST_HEAD(&gsp->registry_list);
> +	gsp->registry_rpc_size = sizeof(PACKED_REGISTRY_TABLE);
>   
> -	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_SET_REGISTRY, rpc_size);
> -	if (IS_ERR(rpc))
> -		return PTR_ERR(rpc);
> +	/* Add the required registry entries first */
> +	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++) {
> +		ret = add_registry_num(gsp, r535_registry_entries[i].name,
> +				 r535_registry_entries[i].value);
> +		if (ret) {
> +			clean_registry(gsp);
> +			return ret;
> +		}
> +	}
> +
> +	/*
> +	 * The NVreg_RegistryDwords parameter is a string of key=value
> +	 * pairs separated by semicolons. We need to extract and trim each
> +	 * substring, and then parse the substring to extract the key and
> +	 * value.
> +	 */
> +	if (NVreg_RegistryDwords) {
> +		char *p = kstrdup(NVreg_RegistryDwords, GFP_KERNEL);
> +		char *start, *next = p, *equal;
> +		size_t length;
> +
> +		/* Remove any whitespace from the parameter string */
> +		length = strip(p, " \t\n");
> +
> +		while ((start = strsep(&next, ";"))) {
> +			long value;
> +
> +			equal = strchr(start, '=');
> +			if (!equal || (equal == start) || (equal[1] == 0)) {
> +				nvkm_error(&gsp->subdev,
> +					"ignoring invalid registry string '%s'\n", start);
> +				continue;
> +			}
>   
> -	rpc->numEntries = NV_GSP_REG_NUM_ENTRIES;
> +			/* Truncate the key=value string to just key */
> +			*equal = 0;
>   
> -	str_offset = offsetof(typeof(*rpc), entries[NV_GSP_REG_NUM_ENTRIES]);
> -	strings = (char *)&rpc->entries[NV_GSP_REG_NUM_ENTRIES];
> -	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++) {
> -		int name_len = strlen(r535_registry_entries[i].name) + 1;
> -
> -		rpc->entries[i].nameOffset = str_offset;
> -		rpc->entries[i].type = 1;
> -		rpc->entries[i].data = r535_registry_entries[i].value;
> -		rpc->entries[i].length = 4;
> -		memcpy(strings, r535_registry_entries[i].name, name_len);
> -		strings += name_len;
> -		str_offset += name_len;
> +			ret = kstrtol(equal + 1, 0, &value);
> +			if (!ret) {
> +				ret = add_registry_num(gsp, start, value);
> +			} else {
> +				/* Not a number, so treat it as a string */
> +				ret = add_registry_string(gsp, start, equal + 1);
> +			}
> +
> +			if (ret) {
> +				nvkm_error(&gsp->subdev,
> +					"ignoring invalid registry key/value '%s=%s'\n",
> +					start, equal + 1);
> +				continue;
> +			}
> +
> +
> +		}
> +
> +		kfree(p);
>   	}
> -	rpc->size = str_offset;
> +
> +	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_SET_REGISTRY, gsp->registry_rpc_size);
> +	if (IS_ERR(rpc)) {
> +		clean_registry(gsp);
> +		return PTR_ERR(rpc);
> +	}
> +
> +	build_registry(gsp, rpc);
>   
>   	return nvkm_gsp_rpc_wr(gsp, rpc, false);
>   }

