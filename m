Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282928B2271
	for <lists+nouveau@lfdr.de>; Thu, 25 Apr 2024 15:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C579910F3F9;
	Thu, 25 Apr 2024 13:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Gr9Gu4RI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F6A10F3F9
 for <nouveau@lists.freedesktop.org>; Thu, 25 Apr 2024 13:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714051381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6GqUJ17MX7fSPNWta9hkm0XjwS874MvPFbznWeyEucU=;
 b=Gr9Gu4RIPyWxVMjiGAduFGAisk1fzIDoI9VuMVS2zIsLUUMg3J0v6z2wJTIvsJQvYGkxhp
 dqf0kpcTCTMfAvcRqa2ZOd9j2P5LwKWg+27dMFWABA9PHWwtZw3jVVxp/CLQt3eP8y5LWR
 sUoHJj4W2mhzFcDdM4HVcxbZLJmuP4k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-FSbX3s_4PYeiopJ_kBqBaA-1; Thu, 25 Apr 2024 09:22:59 -0400
X-MC-Unique: FSbX3s_4PYeiopJ_kBqBaA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-418f8271081so4177435e9.3
 for <nouveau@lists.freedesktop.org>; Thu, 25 Apr 2024 06:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714051378; x=1714656178;
 h=content-transfer-encoding:in-reply-to:cc:organization:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6GqUJ17MX7fSPNWta9hkm0XjwS874MvPFbznWeyEucU=;
 b=lTPGxabLjqRdb6jwZQPSesSq+vQuA7yXK2X+V0v/Z8eCXhlsEbpuMS+7hw6w9uiuhd
 05imxkOWbQ+p8/QnvY9Cbha8gpOmLVqSaDwKy8O9XfeJQhqK+Zjilp81WREOmSZ847GD
 M1MkNJ6asa1XdG1C/qD0HVBAYoSvwpL/iC6V77dgGbszQWcmAGP2mxr9NKRPhVfQOL5y
 BydnsD2xStTU8VM61c6vXPtGw0thIQhhRssnCqO6xWC7vsZln2/8uEQlRJHoHqFrmocR
 C7AG9N0kALHhbaS1Gv4do9rMuABON5QEAwht6Vp8B03LtCxQsF9kInue7/a5WqeTFkcM
 zO7g==
X-Gm-Message-State: AOJu0YyhhcFBFK/OTTIsaDD54wBSCbEIus/v2zD3ECEtrsbMsXWNP/in
 IVuesL2W25zbkc/Jzo9igzsLzsaRKkasVxI5FCfRnW77AygYSSi5ZkzGFqhHwfsKdyvnSoTLpF0
 8vNtRMMcC7br/WJ86EwoiuetWXOMSzAhPHv8OjewxInKbkwR/BIfL8z4yc6meUlI=
X-Received: by 2002:a05:600c:4fc4:b0:418:f991:8ad3 with SMTP id
 o4-20020a05600c4fc400b00418f9918ad3mr4737244wmq.41.1714051378089; 
 Thu, 25 Apr 2024 06:22:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp9uZwNKMR+Lec4WQ00QFiKlunosNmFDDJdWixmUbf0lfiYUMjh37ayp8XLg8lizynMeuLcw==
X-Received: by 2002:a05:600c:4fc4:b0:418:f991:8ad3 with SMTP id
 o4-20020a05600c4fc400b00418f9918ad3mr4737223wmq.41.1714051377693; 
 Thu, 25 Apr 2024 06:22:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a05600c4e9100b004182b87aaacsm27540051wmq.14.2024.04.25.06.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 06:22:57 -0700 (PDT)
Message-ID: <162ef3c0-1d7b-4220-a21f-b0008657f8a5@redhat.com>
Date: Thu, 25 Apr 2024 15:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v7] nouveau: add command-line GSP-RM registry support
To: Timur Tabi <ttabi@nvidia.com>
References: <20240417215317.3490856-1-ttabi@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
Cc: nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>,
 Dave Airlie <airlied@redhat.com>, bskeggs@nvidia.com
In-Reply-To: <20240417215317.3490856-1-ttabi@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 4/17/24 23:53, Timur Tabi wrote:

<snip>

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

With that, I see the following warning compiling this patch.

warning: variable ‘length’ set but not used [-Wunused-but-set-variable]

Did you intend to use the length for anything?

Also, looking at the warning made me aware of 'p' potentially being NULL.

If you agree, I can fix the warning and add the corresponding NULL check when
applying the patch.

- Danilo

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
> 
> base-commit: f7ad2ce5fd89ab5d146da8f486a310746df5dc9e
> prerequisite-patch-id: 9bb653b6a53dcba4171d653e24a242461374f9fe
> prerequisite-patch-id: 7093a9db84053e43f6f278bf1d159a25d14ceebf

