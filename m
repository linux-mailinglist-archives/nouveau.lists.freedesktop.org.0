Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC393CBAADA
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A76E10EA75;
	Sat, 13 Dec 2025 12:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="iEYljnBg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1314 seconds by postgrey-1.36 at gabe;
 Mon, 29 Apr 2024 09:41:12 UTC
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FC110FE3D
 for <nouveau@lists.freedesktop.org>; Mon, 29 Apr 2024 09:41:12 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43T9JHf3110209;
 Mon, 29 Apr 2024 04:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1714382357;
 bh=GAeJutmBfbXi2G1J44pQsF+mK6WtMQQGoTi+2ZHgAFI=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=iEYljnBglN1umF0i0eKBO28GZYJEVrBWJ2wcntfpRn7l/oQMlQqlR8Bk72Jr/bM4b
 4nMvuIvuDF3XW653x9aBPUgnLqcgpPQO2sbxXDy4i4A/b7OJl2XCEejuZuqX21aIEo
 MJRGBCGToX7Ra9u9CAszPvBe0crDw5ucGLl3egc4=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43T9JHKx001675
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 29 Apr 2024 04:19:17 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 29
 Apr 2024 04:19:16 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 29 Apr 2024 04:19:16 -0500
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43T9JD0G118263;
 Mon, 29 Apr 2024 04:19:14 -0500
Message-ID: <c5ff8d3e-ecfc-4970-86c0-540b75b4be2e@ti.com>
Date: Mon, 29 Apr 2024 14:49:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v7] nouveau: add command-line GSP-RM registry support
Content-Language: en-US
To: Timur Tabi <ttabi@nvidia.com>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>,
 <bskeggs@nvidia.com>, <nouveau@lists.freedesktop.org>
References: <20240417215317.3490856-1-ttabi@nvidia.com>
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20240417215317.3490856-1-ttabi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:52 +0000
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

Hi Timur Tabi,

On 18/04/24 3:23 am, Timur Tabi wrote:
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

This patch seems to be breaking latest linux-next (tag: next-20240429).
While building kernel for arm64 on latest linux-next with defconfig, I
see build failure with below error.

❯ make -j$(nproc) ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu-

  CALL    scripts/checksyscalls.sh
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function
‘build_registry’:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1266:3: error: label at
end of compound statement
 1266 |   default:
      |   ^~~~~~~
make[6]: *** [scripts/Makefile.build:244:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o] Error 1
make[5]: *** [scripts/Makefile.build:485: drivers/gpu/drm/nouveau] Error 2
make[4]: *** [scripts/Makefile.build:485: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:485: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:485: drivers] Error 2
make[1]: *** [/home/danish/workspace/linux-next/Makefile:1924: .] Error 2
make: *** [Makefile:240: __sub-make] Error 2

> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
> v7:
>   rebase onto drm-misc-next
>   rename vlen to alloc_size
> 
>  .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |   6 +
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 355 ++++++++++++++++--
>  2 files changed, 337 insertions(+), 24 deletions(-)

[...]

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
> + * +----------------------------------------+
> + * |PACKED_REGISTRY_ENTRY                   |
> + * +----------------------------------------+
> + * |Null-terminated key (string) for entry 0|
> + * +----------------------------------------+
> + * |Binary/string data value for entry 0    | (only if necessary)
> + * +----------------------------------------+
> + *
> + * +----------------------------------------+
> + * |PACKED_REGISTRY_ENTRY                   |
> + * +----------------------------------------+
> + * |Null-terminated key (string) for entry 1|
> + * +----------------------------------------+
> + * |Binary/string data value for entry 1    | (only if necessary)
> + * +----------------------------------------+
> + * ... (and so on, one copy for each entry)
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
> +		registry->entries[i].length = reg->vlen;
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

This line seems to be the culprit.

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

[...]

-- 
Thanks and Regards,
Danish
