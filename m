Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A0D9F2D36
	for <lists+nouveau@lfdr.de>; Mon, 16 Dec 2024 10:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2D710E56A;
	Mon, 16 Dec 2024 09:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QM3Vol3G";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08E310E56C
 for <nouveau@lists.freedesktop.org>; Mon, 16 Dec 2024 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734342329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mUEqVhqEm411y2btyANp0nQYhhxxqt+IdHIRX6Fy7yA=;
 b=QM3Vol3GXTJ7BNjcP+KwoJhydUdIpmJ2UB6dA1/xZBrnPxDEguuG7cx3+AMd6KhXh0C9Jm
 3XDL2elXlu4qSKfGBib8csQXg5yzOsmjzkytQecgpg4CKQwWg2goK/yDKbTYq1snsx1Xlt
 sHkrZ6sR6bFsbNIbPYRUUtsrPHr5w7o=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-SURTyEPNOvmcfB52QpPpzw-1; Mon, 16 Dec 2024 04:45:28 -0500
X-MC-Unique: SURTyEPNOvmcfB52QpPpzw-1
X-Mimecast-MFC-AGG-ID: SURTyEPNOvmcfB52QpPpzw
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-aa6a6dcf9a3so105604266b.0
 for <nouveau@lists.freedesktop.org>; Mon, 16 Dec 2024 01:45:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734342326; x=1734947126;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mUEqVhqEm411y2btyANp0nQYhhxxqt+IdHIRX6Fy7yA=;
 b=C1pMr/xBKF4dA5Vdp4z82LjIycsg+3OvRhLji5X6xXJWGzkLnvNajtODQwDBdcxxJr
 YhkshxQp0K2Bae+S6W+mjwiSwn7zA7sUKibYJMFrTS7l8PQgfRuTO28cpVabAWGZrhH6
 j6HNZ9fPR741wmDP6e2T7NCwFir2BM2Lq3ACeYrjnjQztknFmBxQBiRtK9+HBl6/+I9/
 xEKXL3nrmfQ8CT2yV+vEvPn1R1rSNZcqxyFUfIKyIfksI3M5QpMkDuWkhbi1+S2AS2x5
 yDzMUlNJA47IDMkDG5hv/hOYL2jHDJDB54MpV/jq4Gwa7NgfNlBJ2sS7ulwXYm810gPl
 aI7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3UDESw25Q9WKpyWtAgrXglS8wZ0B/LVspo3xZKIz65W9SFN+wqINTO2SWOsasIm4/FisHcwXW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxME9rWphblZKgk3L23XQ4tWiNj+9eoYx7Rn1v+DepFMnZtV1V0
 mkl6zZ65wFK58yAnSR6IKGU6lM25qZAClz7rK6q6E+ai5bRkwAy1b0qvgjHRXSRIknhdpfx+FX2
 7SnMJrFLQU1VU/rbseuMRUmFAnihXUJSmHOk0YKoCLyL298GbNlnsJjPZu8I5xmVPyWqAfwQ=
X-Gm-Gg: ASbGncs1LEEHIpp1Z2V1jP/fWsO4ctzws0FCpp6vwuMjdqSkTDMC7lGddsqdqn+ImUJ
 iKqoY9CedzpA7vrmwycQrTD0PKCzwBzWFXYe45wqAEgwGVCLy6f4BVwWtI6TaPbJPMdoc3tWhF4
 y4yEwfdrs5wJmf5iUDJBdInNnHc4ayq+5tD4ON5QFNi4jkFm3X/oaUbTnTuy/Yrh5afe4VKrGs5
 AWqTLwFXcI7ec4fCWscztnhWveqBwjkN6gKepQ+SJ53z6Sqgfzd
X-Received: by 2002:a17:906:3289:b0:aa6:7470:8efe with SMTP id
 a640c23a62f3a-aab77907930mr922253266b.13.1734342326548; 
 Mon, 16 Dec 2024 01:45:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZ1z2lzdh2iwu9u26o1qjT8nMT8Dfj1jXT3HMa99NlV9SwaueXBmTZhsa9d+oTc6bnLe3cWQ==
X-Received: by 2002:a17:906:3289:b0:aa6:7470:8efe with SMTP id
 a640c23a62f3a-aab77907930mr922251066b.13.1734342326159; 
 Mon, 16 Dec 2024 01:45:26 -0800 (PST)
Received: from cassiopeiae ([2a00:79c0:644:6900:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652f35365sm3093068a12.80.2024.12.16.01.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 01:45:25 -0800 (PST)
Date: Mon, 16 Dec 2024 10:45:22 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Zhanxin Qi <zhanxin@nfschina.com>
Cc: kherbst@redhat.com, lyude@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/nouveau: Fix memory leak in nvbios_iccsense_parse
Message-ID: <Z1_2sugsla44LgIz@cassiopeiae>
References: <20241216015246.141006-1-zhanxin@nfschina.com>
MIME-Version: 1.0
In-Reply-To: <20241216015246.141006-1-zhanxin@nfschina.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QEuU61czsg78UmSNkNfrSa3L2tEXAJStF3LUj8nXC1c_1734342327
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

Thanks for the patch, some notes below.

On Mon, Dec 16, 2024 at 09:52:46AM +0800, Zhanxin Qi wrote:
> The nvbios_iccsense_parse function allocates memory for sensor data
> but fails to free it when the function exits, leading to a memory
> leak. Add proper cleanup to free the allocated memory.
> 
> Signed-off-by: Zhanxin Qi <zhanxin@nfschina.com>

Please also add a "Fixes:" tag and "Cc: stable@vger.kernel.org" for this.

> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> index 8f0ccd3664eb..502608d575f7 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> @@ -291,6 +291,9 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
>  			list_add_tail(&rail->head, &iccsense->rails);
>  		}
>  	}
> +
> +	kfree(stbl.rail);

I think it's a bit subtile why this is needed here; better add a new inline
function (nvbios_iccsense_cleanup()) to include/nvkm/subdev/bios/iccsense.h that
frees the memory and call this one instead.

While at it, you may also want to send a separate patch, adding a brief comment
to nvbios_iccsense_parse() which notes, that after a successful call to
nvbios_iccsense_parse() it must be cleaned up with nvbios_iccsense_cleanup().

> +
>  	return 0;
>  }
>  
> -- 
> 2.30.2
> 

