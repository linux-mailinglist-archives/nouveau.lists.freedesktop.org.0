Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AC77D41C1
	for <lists+nouveau@lfdr.de>; Mon, 23 Oct 2023 23:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89B110E273;
	Mon, 23 Oct 2023 21:33:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AB810E273
 for <nouveau@lists.freedesktop.org>; Mon, 23 Oct 2023 21:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698096808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XZd41yISFX+lUiY07tb7vMQ/0JXmB7Nfc8wsR9vS8jk=;
 b=NNfNccc6dccrrDLltXW0BDjGOUNUPMeQ4SPEunLoQfjc6EoFKIzJ3febthN38uMF7P0fGR
 V4KkSi7X9JzfWM5Mr6xlzDmdxfP2bQ2TOodjKWmUabTQDReTvmDQh8JkJuLsdrI9cYNSnR
 VLnjx3kCKF+zu0mjbfOinWWEJwd/9bM=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-urGd4dJfN9GseGmJmSs0Ww-1; Mon, 23 Oct 2023 17:33:27 -0400
X-MC-Unique: urGd4dJfN9GseGmJmSs0Ww-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-507cc15323aso3780721e87.0
 for <nouveau@lists.freedesktop.org>; Mon, 23 Oct 2023 14:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698096805; x=1698701605;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XZd41yISFX+lUiY07tb7vMQ/0JXmB7Nfc8wsR9vS8jk=;
 b=r4RBAYG+HaGd6tELM28bfLP4kZ4Q6npk2yCNFeNibCt/KU4mNsvETgpryR6XojpfiU
 fVFId5yugdZIVUmkw/CpuqAfjqQ0MxGeu2goSJvj7WZShe3xwcRhorp0By4oknhxyG08
 WgzvkkWnC6RqKjkkBBRF8TeZA2NA8n9h94tzUrzPtOWNO7UgzzAcjoORWmyybxTN3R4O
 JTRdQZv8gv4VLk6XhU9I/g/lh0GKc9vt7AsKn6ZCN9T2LM5/xwxmIhG6AKQFSrZh8nZ2
 vHdJZsot0daL7fiLfGurvK4bwpq1UM1Yot+UslK0fM2gacIrXUmFtISe1b88kGPPd+YM
 w7XA==
X-Gm-Message-State: AOJu0YxC2CS+kG5a0rX7rWq0ucvhZ4lnfoJeu3ogb69cwdpXkTpiKVLj
 8I6nFxqnj+jNTXGYe5GMbgYpF+VwAkZxs3nq91P14GuWUCYBYvsJceNy119b8xFfxoKdfa4yaga
 zzeosohABzG28a9HvISuL7P8Alw==
X-Received: by 2002:a05:6512:15a4:b0:507:cd2e:5ed8 with SMTP id
 bp36-20020a05651215a400b00507cd2e5ed8mr10456967lfb.0.1698096805511; 
 Mon, 23 Oct 2023 14:33:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGapk6NB4CB9u2pR9vlBZU5cSNx5G9AEjsi+1y4yDuwAgj/D1sdJd9L5nHhS4ooH0bpm4vvyw==
X-Received: by 2002:a05:6512:15a4:b0:507:cd2e:5ed8 with SMTP id
 bp36-20020a05651215a400b00507cd2e5ed8mr10456947lfb.0.1698096805187; 
 Mon, 23 Oct 2023 14:33:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 hb13-20020a170906b88d00b009c46445fcc7sm7255536ejb.33.2023.10.23.14.33.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 14:33:24 -0700 (PDT)
Message-ID: <c358dbdb-1592-4808-90e8-26290ccb21c2@redhat.com>
Date: Mon, 23 Oct 2023 23:33:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
References: <20231008172751.21953-1-bragathemanick0908@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231008172751.21953-1-bragathemanick0908@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Fixing indentation and adding
 License Identifier tag
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 10/8/23 19:27, Bragatheswaran Manickavel wrote:
> On running checkpatch.pl to nouveau_drm.h identified
> few warnings. Fixing them in this patch
> 
> WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> +/*
> 
> WARNING: space prohibited between function name and open parenthesis '('
> +#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE +
> DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)

Even though this fixes a checkpatch warning, I don't see how this change
improves readability, rather the opposite. Personally, I prefer keeping this
as it is.

- Danilo

> 
> Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
> ---
>   include/uapi/drm/nouveau_drm.h | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
> index 8d7402c13e56..900ca4f1ebe5 100644
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: MIT */
>   /*
>    * Copyright 2005 Stephane Marchesin.
>    * All Rights Reserved.
> @@ -448,15 +449,15 @@ struct drm_nouveau_svm_bind {
>   
>   #define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
>   #define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
> -#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
> +#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW(DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
>   
>   #define DRM_IOCTL_NOUVEAU_SVM_INIT           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SVM_INIT, struct drm_nouveau_svm_init)
>   #define DRM_IOCTL_NOUVEAU_SVM_BIND           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SVM_BIND, struct drm_nouveau_svm_bind)
>   
>   #define DRM_IOCTL_NOUVEAU_GEM_NEW            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_NEW, struct drm_nouveau_gem_new)
>   #define DRM_IOCTL_NOUVEAU_GEM_PUSHBUF        DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_PUSHBUF, struct drm_nouveau_gem_pushbuf)
> -#define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
> -#define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
> +#define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
> +#define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
>   #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
>   
>   #define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)

