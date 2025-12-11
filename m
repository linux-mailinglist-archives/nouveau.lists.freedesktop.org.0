Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B285CB742C
	for <lists+nouveau@lfdr.de>; Thu, 11 Dec 2025 23:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071D310E7A1;
	Thu, 11 Dec 2025 22:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WTJkE8pA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACD110E7A1
 for <nouveau@lists.freedesktop.org>; Thu, 11 Dec 2025 22:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765490840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S/yt3h0LA2CQSgeXoj4ym7AxrOljIdTgGQSxKRVOCsQ=;
 b=WTJkE8pAQNJNuoW7hYIX4QDDGO3WHL2oZlh/iOGVZkTvpq2XTATS6mdJjaKJqbaPvWZumm
 WmxUWHnTMtiOx1ygocNmVJqzW44dREZRElZ30uZy/AfwzrNQOse6a1cOOSLRm+s+EpbuAZ
 B4eZ/xw8yzWN8CKM2aMM8m7uJ1WvLpo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-SOiTQGbHNxuCT88sbqkRIg-1; Thu, 11 Dec 2025 17:07:17 -0500
X-MC-Unique: SOiTQGbHNxuCT88sbqkRIg-1
X-Mimecast-MFC-AGG-ID: SOiTQGbHNxuCT88sbqkRIg_1765490837
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-882485f2984so11050716d6.0
 for <nouveau@lists.freedesktop.org>; Thu, 11 Dec 2025 14:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765490837; x=1766095637;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S/yt3h0LA2CQSgeXoj4ym7AxrOljIdTgGQSxKRVOCsQ=;
 b=r9QD0OuMmnnb+g4EaOyHvCGxA3pOcim2VN82YhmMVQSptEZt68Rm0ivR3TupC4soDo
 TCt4nIE6qKtZUDJMZkJBAr4c97YzbVAwYPwsgNAoP3SPvLqr5rlnrL48xJhURHl0+Etq
 nV9ew8xa9kFSpdpooDqLYjHqw517ScUaeXvWTeaLGb7AW8Fxb6wlkpgc4x8bJARJKO0z
 vakADcaGOGIISrqfsgOkawjiEmcYMRIZhgb+IbAoEZDsCUPlsGJYjK3pWPJW/fVI+3HW
 ZAtDeqQC0RbWEFL6Iq/O9oS6L+zlGk3Zqaz0FoNmZErQZjmcyROwrA/vJNuq7s7HfiHt
 vOcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7sBXWmxtP0HA3NEA9LrrusddktWHwrSpNo1tUjo7Ti795SIm6YffHI3cjMEIzWC5GOmBctxyq@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3DjkoH/6tK/wFJTMWv7G+Ilp2HmusepaeaQlKRUIWUvmq3dpi
 sADW03oiPyU/wNHJbJ0RnUSu7agK5/wTyJns3oMK5OTB5xBK029lurNUaXqT7/PUUiaoudtjcYb
 K1o44JHX0RXKejuy+MdgUo6R7SPjoJKvTe2qECEpPe/XSwsCeWdKkZ/wvsw6xJZvXzkk=
X-Gm-Gg: AY/fxX4dHJPLdQqI3byXfBLQGhNa669cdIwAy7JPceDnpBrv4kstSKVssoBJSKV7Z9p
 /KPdsKeVpZ6tXPQc7OmFY+GywFxQzbfLL/dRq/yrVE+4RxxMPtJDaOaICwGM4gfs3SDttRvD1qO
 5MMbubRdYf+DF9iFLamAVDDuImIhpUISOHnJLiSf/EPO2r7iBzykl7s36FvYaQIVDj4KZUnKpTr
 Ua18YByC3L3+vAHjXJKdKmc4FfmPdgGU4vzD/jsI/nQS6Gh3+7R8YNNE2yfAFwe62RXRd24bEYv
 ucR86o+Xv64o/CHaxoEO9lB3GNbhR9rXRQ2dlltYJ8amDrSxXtIaeB47gnBVA+dsS7dhs997jsV
 j4tFno3oSBgcioYBt2/M4X6G5P40nE863ZCwynyd4IlObvCbwE2iNITg=
X-Received: by 2002:a05:6214:1247:b0:87c:27c2:2c0e with SMTP id
 6a1803df08f44-8887e7f4717mr2002896d6.59.1765490836917; 
 Thu, 11 Dec 2025 14:07:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpL7P109j0TrrJ6OMch/eU/9skpG1csWeSXfbkzBfpFzWr1R23nHPE1F9w7iK8jbzWzXkOng==
X-Received: by 2002:a05:6214:1247:b0:87c:27c2:2c0e with SMTP id
 6a1803df08f44-8887e7f4717mr2002536d6.59.1765490836603; 
 Thu, 11 Dec 2025 14:07:16 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net.
 [100.0.77.142]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8886ec56964sm31777496d6.21.2025.12.11.14.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 14:07:16 -0800 (PST)
Message-ID: <a8276c36fe1638cc584262d0d722623987deb1ae.camel@redhat.com>
Subject: Re: [PATCH 6/9] gpu: nova-core: gsp: derive Zeroable for
 GspStaticConfigInfo
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:07:15 -0500
In-Reply-To: <20251208-nova-misc-v1-6-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
 <20251208-nova-misc-v1-6-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M3WiOVqD2nVOO-qmMfdkbCudDYimQtwQwmkFn8ucCdE_1765490837
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2025-12-08 at 18:26 +0900, Alexandre Courbot wrote:
> We can derive `Zeroable` automatically instead of implementing it
> ourselves if we convert it from a tuple struct into a regular one.
> This
> removes an `unsafe` statement.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> =C2=A0drivers/gpu/nova-core/gsp/fw/commands.rs | 11 +++++------
> =C2=A01 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs
> b/drivers/gpu/nova-core/gsp/fw/commands.rs
> index 21be44199693..85465521de32 100644
> --- a/drivers/gpu/nova-core/gsp/fw/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
> @@ -107,12 +107,15 @@ unsafe impl FromBytes for PackedRegistryTable
> {}
> =C2=A0
> =C2=A0/// Payload of the `GetGspStaticInfo` command and message.
> =C2=A0#[repr(transparent)]
> -pub(crate) struct
> GspStaticConfigInfo(bindings::GspStaticConfigInfo_t);
> +#[derive(Zeroable)]
> +pub(crate) struct GspStaticConfigInfo {
> +=C2=A0=C2=A0=C2=A0 inner: bindings::GspStaticConfigInfo_t,
> +}
> =C2=A0
> =C2=A0impl GspStaticConfigInfo {
> =C2=A0=C2=A0=C2=A0=C2=A0 /// Returns a bytes array containing the (hopefu=
lly) zero-
> terminated name of this GPU.
> =C2=A0=C2=A0=C2=A0=C2=A0 pub(crate) fn gpu_name_str(&self) -> [u8; 64] {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.0.gpuNameString
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.inner.gpuNameString
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
> =C2=A0
> @@ -122,7 +125,3 @@ unsafe impl AsBytes for GspStaticConfigInfo {}
> =C2=A0// SAFETY: This struct only contains integer types for which all bi=
t
> patterns
> =C2=A0// are valid.
> =C2=A0unsafe impl FromBytes for GspStaticConfigInfo {}
> -
> -// SAFETY: This struct only contains integer types and fixed-size
> arrays for which
> -// all bit patterns are valid.
> -unsafe impl Zeroable for GspStaticConfigInfo {}

