Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E86CB7459
	for <lists+nouveau@lfdr.de>; Thu, 11 Dec 2025 23:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D80510E12C;
	Thu, 11 Dec 2025 22:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F3pShJVM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AD110E8AC
 for <nouveau@lists.freedesktop.org>; Thu, 11 Dec 2025 22:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765491025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DRrw2mEFcasOCUpxE3z89bZ0+erUgaOzx3WZhCZMjA4=;
 b=F3pShJVMCOPwNepdd+b8mMCZRMmONUPqimF4GLNK9XR+weZE1gsOzJ7P9PsMKw9au4eTcE
 HEjvsaApUbId0a5F8Q4tthgMmEOt4vM23XLgrkYchaIDIOeBb0+CNw4s6k3yifQpYCTEoS
 tbTEf1ykgJOVaYnLEuPrWgh2Qs0PsYs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-uOzTK5ynP12mF4u0qMw2TA-1; Thu, 11 Dec 2025 17:10:21 -0500
X-MC-Unique: uOzTK5ynP12mF4u0qMw2TA-1
X-Mimecast-MFC-AGG-ID: uOzTK5ynP12mF4u0qMw2TA_1765491020
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-42b2fb13b79so299213f8f.3
 for <nouveau@lists.freedesktop.org>; Thu, 11 Dec 2025 14:10:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765491020; x=1766095820;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DRrw2mEFcasOCUpxE3z89bZ0+erUgaOzx3WZhCZMjA4=;
 b=LHZzI8dIMDGA7LnGZDQUCPUztVKRrGVgcvL1+K7r/wIHWRfDXjQDV2m66MRf8npNXF
 GqDTuANcuXulNvUjyV4yc14UfGT6jmMUO/CEMbsbM9xyoPm9i18Hc6PLk792OtNfBXBB
 vXfa2aPDIFZ0XyIpJp6t2VpTF6JVUSbN6Cx7D1y8xXYR2rTn0z7OkGpWkL1iqWI3LaNK
 fvAtnE59R1ckMY8j/miMEc+leDwM5+7crA5RdQMSHquYUHJKAIdizyg07AmSD4TUDFwn
 DDI8tHil1sjBGP7giRGpRrmC8llRsALML9iFd7L/osqtjmxsr5pIYVna7L73jg0667Wd
 JvnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNzkkBUUFsJwjq6gmH7/ocolyFZwHyYt8HvRx3zntYlyr5YAXPCdL8EzfvNm0KrVPQEjtQsLAN@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymW5Z9kIrcwL2haJLrKxDRrMBlQH/gClhQPfa63v/d7Qy/aW2a
 9wZla1RL7vR006JRDH4e4Z/JuRIisA4wqgJD8/otdCFwrwkMnEFWZMTA2x+MqpyMMqSc2uUFmat
 fQ4YYN9pBFx5iXRsVnmU8zJ0Qrb7kBHnb5dDu7Z6H8VvunfSRAgLfBTFJRSvTib/q4jI=
X-Gm-Gg: AY/fxX5tLRVGlCqGWamLj5VFGocG+ajgq1iRAm75gkUCAPLT0wsTuDUgqyVDZ6tfT6K
 pXSHIV++7X2NYWTA28rMj9vbXENi0E/Y84utcuwMY9L1/gAbPgjWCPhUhB3+aBHgSsEKSF/9xJF
 DUQdcIMGUbSm7vKO5d8Z9bCJv3kUVwC8owFOHsghG1CVpgmJkvC5dNkoAIKJXGv4RRmNh/QKkgi
 0AiGbbeqducLmhrx7oec2QFvTsSzArlOJ+rV3B9YyZqVdSQD59z/6asL6tbRTIQTA7qMvOCIEwt
 TTBV5NU2HUKVokBXjPtghSSdeHiF+6SY/OOvKaUehWW7MLon37tLfIscVd8p0y5vMUcTJ771jSw
 PmDMYqlM/gvCfFHD2zgDZmCgshzfUB4wxjPsl5oTAi/WaMC7wSWQEn90=
X-Received: by 2002:a05:6000:1ac8:b0:42f:8816:c01d with SMTP id
 ffacd0b85a97d-42fa3b1ef32mr7586039f8f.61.1765491020508; 
 Thu, 11 Dec 2025 14:10:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFusB0V2Lib9x8KFjWMKFfd38tMcGVkGiclpC9vpvKusJCxtLUq3Q5ZipoVVIeu/ntr7EJIkw==
X-Received: by 2002:a05:6000:1ac8:b0:42f:8816:c01d with SMTP id
 ffacd0b85a97d-42fa3b1ef32mr7586020f8f.61.1765491020099; 
 Thu, 11 Dec 2025 14:10:20 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net.
 [100.0.77.142]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a665e3sm8220590f8f.6.2025.12.11.14.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 14:10:19 -0800 (PST)
Message-ID: <678b25aba2bdb2e08818780f6ae16470e83fb8ff.camel@redhat.com>
Subject: Re: [PATCH 9/9] gpu: nova-core: simplify str_from_null_terminated
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:10:16 -0500
In-Reply-To: <20251208-nova-misc-v1-9-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
 <20251208-nova-misc-v1-9-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KZOUFvoCHld_9sEKaHe3-pc7zduDYopG2lBO9irzrtY_1765491020
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

On Mon, 2025-12-08 at 18:27 +0900, Alexandre Courbot wrote:
> The core library's `CStr` has a `from_bytes_until_nul` method that we
> can leverage to simplify this function.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> =C2=A0drivers/gpu/nova-core/util.rs | 9 ++-------
> =C2=A01 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-
> core/util.rs
> index 8b2a4b99c55b..2cccbce78c14 100644
> --- a/drivers/gpu/nova-core/util.rs
> +++ b/drivers/gpu/nova-core/util.rs
> @@ -2,15 +2,10 @@
> =C2=A0
> =C2=A0/// Converts a null-terminated byte slice to a string, or `None` if
> the array does not
> =C2=A0/// contains any null byte or contains invalid characters.
> -///
> -/// Contrary to [`core::ffi::CStr::from_bytes_with_nul`], the null
> byte can be anywhere in the
> -/// slice, and not only in the last position.
> =C2=A0pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> Option<&str=
>
> {
> =C2=A0=C2=A0=C2=A0=C2=A0 use core::ffi::CStr;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 bytes
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .iter()
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .position(|&b| b =3D=3D 0)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .and_then(|null_pos|
> CStr::from_bytes_with_nul(&bytes[..=3Dnull_pos]).ok())
> +=C2=A0=C2=A0=C2=A0 CStr::from_bytes_until_nul(bytes)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ok()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .and_then(|cstr| cstr.to=
_str().ok())
> =C2=A0}

