Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB4F8B7959
	for <lists+nouveau@lfdr.de>; Tue, 30 Apr 2024 16:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D2F10FD64;
	Tue, 30 Apr 2024 14:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="geCpR0rq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7411210E9BD
 for <nouveau@lists.freedesktop.org>; Tue, 30 Apr 2024 14:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714487303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/MM0Zw96Qb6fDdqFHf7PUfcuVaMhbi/uJt8dRXGIYQg=;
 b=geCpR0rquhd2jixObD23NUHS3A7YU0THpI922DtYHccfb/6WgQvVDKnRX5fBfnVUzqcA9G
 1l6tJyF/BBoLirWUXoK0VgAy2+69v4nXtHlqz9nYWTBaVr4CG0dA6Tkjz5tfwKjIHprCUm
 6ziSAy+okYxJRzehH+qQ7JZSvXM4m3Q=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-LiSlSj73OPqyfjfwA_BQQQ-1; Tue, 30 Apr 2024 10:28:22 -0400
X-MC-Unique: LiSlSj73OPqyfjfwA_BQQQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2d87b880861so50414841fa.1
 for <nouveau@lists.freedesktop.org>; Tue, 30 Apr 2024 07:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714487299; x=1715092099;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/MM0Zw96Qb6fDdqFHf7PUfcuVaMhbi/uJt8dRXGIYQg=;
 b=ToprK0z/dNQkyxaZTa2RH/JosvZCjIYkrSiRuIqnlQOlSZSTEtaGLTvfTH4MPjl/GT
 hUsuWnMGWQ8m+Cy3ZD4mlEB9A/GhJ3U/qIwo1T45qbwsFnKYSVBGoChzO+0Zo1kIsE/3
 LtVXW+nw0M+pn1ig98NnVwGd15CeGEGdqRGEmRL8YTNeBBCl4tHPD/fbY2CcIMPh6Z0k
 r2cUy/Bg4WsKMoELnIIlqZEambniB8lzY3ASC4kPjCsTiMU55N8+iTMIT7DSCwS6NaRG
 e+abZUa/BAHNQSrRJsSFRlZmXngxqGmDB/eLXlloBuy+qqJonK0GKDMXtVoTybeC2KMg
 /p1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD2FGfX/IAGU7DxAcCY9PrQkPnK8nSASn90IRrjaDmxaaEHnJymvi4ScY2s4NmmaYt61kwD8J2z+f0GW6bDdCCXq3OYVGeynvM2O2EXw==
X-Gm-Message-State: AOJu0Yz7dD/ho9rBeaGIB3W992JGJaazK99b0p6UND1nd+4u9jLnyRLb
 eEvjqho6AaOyC2E/o66+sbCQm0Rl1lt6sKiR9TyilG027ckXxd+RHZa2+B1baP3P20WIqKAx+sJ
 Iv0jFscE4YvQk1OjLubxVQ+GeJc7M+iqb3EhS3QBHHENWjfnWXcahLqfDUewBl0s=
X-Received: by 2002:a2e:780d:0:b0:2e0:b713:6bc1 with SMTP id
 t13-20020a2e780d000000b002e0b7136bc1mr3375477ljc.1.1714487299710; 
 Tue, 30 Apr 2024 07:28:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd6fssLgRyfH/vGDmKq0ffIOhd6yz08RDVy6Jh4KZgUjwuBfI1xrx/kB8L2ydCD//3VjqM1Q==
X-Received: by 2002:a2e:780d:0:b0:2e0:b713:6bc1 with SMTP id
 t13-20020a2e780d000000b002e0b7136bc1mr3375398ljc.1.1714487297289; 
 Tue, 30 Apr 2024 07:28:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 iv20-20020a05600c549400b00418e4cc9de7sm45112298wmb.7.2024.04.30.07.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 07:28:16 -0700 (PDT)
Message-ID: <a94e756f-1d1c-4b3a-ae87-dcd7508e94c5@redhat.com>
Date: Tue, 30 Apr 2024 16:28:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau: Add missing break statement
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: ttabi@nvidia.com, lucas.demarchi@intel.com, airlied@redhat.com,
 lyude@redhat.com, bskeggs@nvidia.com
References: <20240430131840.742924-1-chaitanya.kumar.borah@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240430131840.742924-1-chaitanya.kumar.borah@intel.com>
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

On 4/30/24 15:18, Chaitanya Kumar Borah wrote:
> Add the missing break statement that causes the following build error
> 
> 	  CC [M]  drivers/gpu/drm/i915/display/intel_display_device.o
> 	../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function ‘build_registry’:
> 	../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1266:3: error: label at end of compound statement
> 	1266 |   default:
> 	      |   ^~~~~~~
> 	  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.o
> 	  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
> 	  CC [M]  drivers/gpu/drm/amd/amdgpu/imu_v11_0.o
> 	make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o] Error 1
> 	make[7]: *** Waiting for unfinished jobs....
> 
> Fixes: b58a0bc904ff ("nouveau: add command-line GSP-RM registry support")
> Closes: https://lore.kernel.org/all/913052ca6c0988db1bab293cfae38529251b4594.camel@nvidia.com/T/#m3c9acebac754f2e74a85b76c858c093bb1aacaf0
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Applied to drm-misc-next, thanks!

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 0b46db5c77b8..63619512e7f6 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -1264,6 +1264,7 @@ static void build_registry(struct nvkm_gsp *gsp, PACKED_REGISTRY_TABLE *registry
>   			str_offset += reg->vlen;
>   			break;
>   		default:
> +			break;
>   		}
>   
>   		i++;

