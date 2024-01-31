Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FC88447B1
	for <lists+nouveau@lfdr.de>; Wed, 31 Jan 2024 20:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07B410E9FB;
	Wed, 31 Jan 2024 19:01:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D17B10FC29
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jan 2024 19:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706727678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QttKSGMrYlAP/gIIbSl5aAxKkZ0juKyP2Dpz3AfaDWk=;
 b=QRsecpk2M0yZymEpd0k03tKdcaOFrNJWwHSepNRRAtimsG5yB+HxxZ5PhTs2xqrwagvD2k
 ZlTvALjS9rR7EXwREjZTGl2bfsfT5CpRI0J59lz+qKehKRBt0RDn/sVwtFJLi2WAbhA19M
 7dKskh5SHCdU5XJwl3haksduHALYbgU=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-YFX1g3JlMcWQTRN9GP2WEw-1; Wed, 31 Jan 2024 14:01:16 -0500
X-MC-Unique: YFX1g3JlMcWQTRN9GP2WEw-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2cf4f468ab5so2393771fa.2
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jan 2024 11:01:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706727674; x=1707332474;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QttKSGMrYlAP/gIIbSl5aAxKkZ0juKyP2Dpz3AfaDWk=;
 b=UAxWSSnY1JEy4xdB9APUracLBh1OEmieGUlR3EZsTs64CQXe4bbEHP05Ru1DdVlV7K
 1ed5YxuTqhDInBX1vtYNNaVGK5j466Mamov6NB+llNLzPEdsEDFVasT00CxXjNSg5tSi
 lh6IvGJRonwHIxO4YDc81wEYb6RXXppSlvlUtiPx2OnyEaodYta9KBnF2tI3qCqwJk/s
 l8I0ALuPgiG8TezV68wjd415GGiJu6WfMoEVeK1KLgdMcNiAANsfK/2pAYkmNClTsn5r
 rpUSz9YsbAqbap+jMeqgEUSmc4InkEZCJG7fV8+HfMLRvHSrodCHXrISAa3rVGlaLENH
 WFDw==
X-Gm-Message-State: AOJu0YwSg4zIMgfFMAXCHv79Mywlxvz+JiLlHvpdmCsk043KAdtVNgiS
 xELOE7bAViLeCrtJGz45TlLdMkF6pKXUJzxDKqXVuBdj7qQ1MN+6QzE3W59ImY5UxDzuBY7R2hx
 memIN//3vyrv1defKk7vgDFHKNuAHKwPB/Lcgm9czPvqc7W+I1VwPZAPWTsmPFLI=
X-Received: by 2002:a2e:6e09:0:b0:2d0:5a90:647b with SMTP id
 j9-20020a2e6e09000000b002d05a90647bmr1669585ljc.2.1706727674659; 
 Wed, 31 Jan 2024 11:01:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfL8rdW2PTd0sP4TQvzsVo3v4EjqT1ZZlnbGUdtbTl3/LC2Y1uwwBWLtW8T8bCdEsn1mXDHg==
X-Received: by 2002:a2e:6e09:0:b0:2d0:5a90:647b with SMTP id
 j9-20020a2e6e09000000b002d05a90647bmr1669575ljc.2.1706727674218; 
 Wed, 31 Jan 2024 11:01:14 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 fd12-20020a056402388c00b00557d839727esm6123032edb.7.2024.01.31.11.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 11:01:13 -0800 (PST)
Message-ID: <a8b9677e-2d51-4cdd-8105-02649ec221ea@redhat.com>
Date: Wed, 31 Jan 2024 20:01:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/nouveau/acr/ga102: remove unused but set variable
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1704908087.git.jani.nikula@intel.com>
 <4d9f62fa6963acfd8b7d8f623799ba3a516e347d.1704908087.git.jani.nikula@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <4d9f62fa6963acfd8b7d8f623799ba3a516e347d.1704908087.git.jani.nikula@intel.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 1/10/24 18:39, Jani Nikula wrote:
> Fix the W=1 warning -Wunused-but-set-variable.
> 
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> index f36a359d4531..bd104a030243 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> @@ -218,7 +218,7 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subdev *subdev,
>   		const struct firmware *hsbl;
>   		const struct nvfw_ls_hsbl_bin_hdr *hdr;
>   		const struct nvfw_ls_hsbl_hdr *hshdr;
> -		u32 loc, sig, cnt, *meta;
> +		u32 sig, cnt, *meta;
>   
>   		ret = nvkm_firmware_load_name(subdev, path, "hs_bl_sig", ver, &hsbl);
>   		if (ret)
> @@ -227,7 +227,6 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subdev *subdev,
>   		hdr = nvfw_ls_hsbl_bin_hdr(subdev, hsbl->data);
>   		hshdr = nvfw_ls_hsbl_hdr(subdev, hsbl->data + hdr->header_offset);
>   		meta = (u32 *)(hsbl->data + hshdr->meta_data_offset);
> -		loc = *(u32 *)(hsbl->data + hshdr->patch_loc);
>   		sig = *(u32 *)(hsbl->data + hshdr->patch_sig);
>   		cnt = *(u32 *)(hsbl->data + hshdr->num_sig);
>   

