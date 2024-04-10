Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D769389F0DA
	for <lists+nouveau@lfdr.de>; Wed, 10 Apr 2024 13:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDB710EF19;
	Wed, 10 Apr 2024 11:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="f2ncv5ku";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AAA10EF19
 for <nouveau@lists.freedesktop.org>; Wed, 10 Apr 2024 11:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712748656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ElLcAz6Rliizk5z2Pn1Gff5suMsyXmsIrWcDxVcWpkA=;
 b=f2ncv5kuu9S6hjzo+5YTDC8jp5uioPQ//n6NZcrcVn8Q+UmJqHwCcSdO596nmSX5gZ6pwd
 63QhJR2kIxiojZc9mUEeB962nv4vSTA/Kj3YebnlsXfmeOQR3aJAhKw6q2iu7Z+CWlvsUt
 EJ4vO6Lwo7ty4h8l1OXESDr6CS1uCPY=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-BK_q0O5dP9u8gv0AxJpEaQ-1; Wed, 10 Apr 2024 07:30:54 -0400
X-MC-Unique: BK_q0O5dP9u8gv0AxJpEaQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2d6ef704b35so57297571fa.2
 for <nouveau@lists.freedesktop.org>; Wed, 10 Apr 2024 04:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712748653; x=1713353453;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ElLcAz6Rliizk5z2Pn1Gff5suMsyXmsIrWcDxVcWpkA=;
 b=DJ6vc0/FRQwPnoSZFU30vfeutqC9DyPrei83QmmcSshB7x1r10tNz+4tAXzrc2dq+I
 n0yVzBu8Ez6jcltiKGQwZArDr+7Xkrwkk3rPVX4ANUJ6Xknz7Y4xyqGAHN4nHAr63wRd
 K9O6HQUPeWMNN3pJsWL2NfRzMktWrnNau0HVPlC+eir+E2om97h0JUQTLaDhxgZM0QUM
 CKU7y5rpyXD3RgJk+uthyKCd7E17VJe4KHfJghe+n06Z/o17yNG7tsizxeRNSRRtzCCB
 Bj5Aycx9y6qQmutzt9AnmMFgxr/8AXd7O8yw/62zQ8yvZ5wC3/u4vQCfN+4CNjI5aLjc
 AdtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTuG1eC7MWQhXBo0umfFADaf2PYidhFmdat6Xws1ubf+8/8wOOl5qrbD+cF0GPXIvm0B8upr30ljhTEj6wKXUowDGe7uTasK7P3D94Og==
X-Gm-Message-State: AOJu0Yylb1UsbEcVGiOsrkHea9EQFWzhwNkS5xKTZ0CmzFsobpirY6jK
 ytBBWq+b1raneHOT+3gn8uHwkjpms0v6TKoC62l95cEt6uF057/jTy7LGubOx09pjMb+rCJrbD8
 TaSdydig5jNBHNY5upbVgJUiprnlKXvda+peIpBqXkTddBG3gPONAVy3H02Gwl5c=
X-Received: by 2002:a05:651c:505:b0:2d8:d9f9:c615 with SMTP id
 o5-20020a05651c050500b002d8d9f9c615mr889187ljp.14.1712748653102; 
 Wed, 10 Apr 2024 04:30:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6iJF48bgm38zNr+QehsIdRsgT4UyLtuwzBD5r5TZoksupvPT1Z4y4g7MhhXSFHxVjTmi+2Q==
X-Received: by 2002:a05:651c:505:b0:2d8:d9f9:c615 with SMTP id
 o5-20020a05651c050500b002d8d9f9c615mr889172ljp.14.1712748652593; 
 Wed, 10 Apr 2024 04:30:52 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b0041628f694dfsm1983654wmb.23.2024.04.10.04.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 04:30:52 -0700 (PDT)
Date: Wed, 10 Apr 2024 13:30:50 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: Dave Airlie <airlied@redhat.com>, nouveau@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] [v5] nouveau: add command-line GSP-RM registry support
Message-ID: <ZhZ4apj6ZEMlbiLR@pollux>
References: <20240409231552.2557643-1-ttabi@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240409231552.2557643-1-ttabi@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Tue, Apr 09, 2024 at 06:15:52PM -0500, Timur Tabi wrote:
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
> ---
> v5:
> Add REGISTRY_MAX_KEY_LENGTH
> registry_list_entry.key is now char[64] instead of char *
> use strnlen instead of strlen
> removed some debug printks
> fixed most checkpatch complaints
> rebased to drm-fixes

This patch seems to be based on drm-misc-fixes instead. For this patch the
correct target branch would be drm-misc-next though.

You can, additionally, use '--base' when running git format-patch. This will
include the hash of the base commit.

> 
>  .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |   6 +
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 360 ++++++++++++++++--
>  2 files changed, 342 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index 6f5d376d8fcc..3fbc57b16a05 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -211,6 +211,12 @@ struct nvkm_gsp {
>  		struct mutex mutex;;
>  		struct idr idr;
>  	} client_id;
> +
> +	/* A linked list of registry items. The registry RPC will be built from it. */
> +	struct list_head registry_list;
> +
> +	/* The size of the registry RPC */
> +	size_t registry_rpc_size;
>  };
>  
>  static inline bool
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 9858c1438aa7..981ddd0fb1e7 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -54,6 +54,8 @@
>  #include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
>  
>  #include <linux/acpi.h>
> +#include <linux/ctype.h>
> +#include <linux/parser.h>
>  
>  #define GSP_MSG_MIN_SIZE GSP_PAGE_SIZE
>  #define GSP_MSG_MAX_SIZE GSP_PAGE_MIN_SIZE * 16
> @@ -1080,51 +1082,361 @@ r535_gsp_rpc_unloading_guest_driver(struct nvkm_gsp *gsp, bool suspend)
>  	return nvkm_gsp_rpc_wr(gsp, rpc, true);
>  }
>  
> +enum registry_type {
> +	REGISTRY_TABLE_ENTRY_TYPE_DWORD  = 1, /* 32-bit unsigned integer */
> +	REGISTRY_TABLE_ENTRY_TYPE_BINARY = 2, /* Binary blob */
> +	REGISTRY_TABLE_ENTRY_TYPE_STRING = 3, /* Null-terminated string */
> +};
> +
> +/* An arbitrary limit to the length of a registry key */
> +#define REGISTRY_MAX_KEY_LENGTH		64
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
> +	char key[REGISTRY_MAX_KEY_LENGTH] __counted_by(klen);

Now that this is an array, we should remove the __counted_by() annotation.

> +	u32 dword;				/* TYPE_DWORD */
> +	u8 binary[] __counted_by(vlen);	/* TYPE_BINARY or TYPE_STRING */

NIT: Can't we put these two into a union?

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
> +	size_t nlen = strnlen(key, REGISTRY_MAX_KEY_LENGTH) + 1;

Guess the only reason for strnlen() here is that you want to stop counting once
you exceed REGISTRY_MAX_KEY_LENGTH anyway, right?

> +	size_t vlen; /* value length, non-zero if binary or string */
> +
> +	if (nlen > REGISTRY_MAX_KEY_LENGTH)
> +		return -EFBIG;

Still prefer EINVAL, EFBIG doesn't really apply here.

> +
> +	vlen = (type == REGISTRY_TABLE_ENTRY_TYPE_DWORD) ? 0 : length;
> +
> +	reg = kmalloc(sizeof(*reg) + vlen, GFP_KERNEL);
> +	if (!reg)
> +		return -ENOMEM;
> +
> +	switch (type) {
> +	case REGISTRY_TABLE_ENTRY_TYPE_DWORD:
> +		reg->dword = *(const u32 *)(data);
> +		break;
> +	case REGISTRY_TABLE_ENTRY_TYPE_BINARY:
> +	case REGISTRY_TABLE_ENTRY_TYPE_STRING:
> +		memcpy(reg->binary, data, length);

Prefer to use vlen here...

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

...and here.

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
> +		/* Append the key name to the table */
> +		registry->entries[i].nameOffset = str_offset;
> +		memcpy((void *)registry + str_offset, reg->key, reg->klen);
> +		str_offset += reg->klen;
> +
> +		switch (reg->type) {
> +		case REGISTRY_TABLE_ENTRY_TYPE_DWORD:
> +			registry->entries[i].data = reg->dword;
> +			break;
> +		case REGISTRY_TABLE_ENTRY_TYPE_BINARY:
> +		case REGISTRY_TABLE_ENTRY_TYPE_STRING:
> +			/* If the type is binary or string, also append the value */
> +			memcpy((void *)registry + str_offset, reg->binary, reg->vlen);
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
>  /* dword only */
>  struct nv_gsp_registry_entries {
>  	const char *name;
>  	u32 value;
>  };
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
>  static const struct nv_gsp_registry_entries r535_registry_entries[] = {
>  	{ "RMSecBusResetEnable", 1 },
>  	{ "RMForcePcieConfigSave", 1 },
>  };
>  #define NV_GSP_REG_NUM_ENTRIES ARRAY_SIZE(r535_registry_entries)
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
>  static int
>  r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
>  {
>  	PACKED_REGISTRY_TABLE *rpc;
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
> +	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++) {
> +		ret = add_registry_num(gsp, r535_registry_entries[i].name,
> +				       r535_registry_entries[i].value);
> +		if (ret) {
> +			clean_registry(gsp);
> +			return ret;
> +		}
> +	}
>  
> -	rpc->numEntries = NV_GSP_REG_NUM_ENTRIES;
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
> +			if (!equal || equal == start || equal[1] == 0) {
> +				nvkm_error(&gsp->subdev,
> +					   "ignoring invalid registry string '%s'\n",
> +					   start);
> +				continue;
> +			}
>  
> -	str_offset = offsetof(typeof(*rpc), entries[NV_GSP_REG_NUM_ENTRIES]);
> -	strings = (char *)rpc + str_offset;
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
> +			/* Truncate the key=value string to just key */
> +			*equal = 0;
> +
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
> +					   "ignoring invalid registry key/value '%s=%s'\n",
> +					   start, equal + 1);
> +				continue;
> +			}
> +		}
> +
> +		kfree(p);
>  	}
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
>  	return nvkm_gsp_rpc_wr(gsp, rpc, false);
>  }
> -- 
> 2.34.1
> 

