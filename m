Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65003CB7438
	for <lists+nouveau@lfdr.de>; Thu, 11 Dec 2025 23:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1FD10E884;
	Thu, 11 Dec 2025 22:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aKBw8+Ug";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4A910E884
 for <nouveau@lists.freedesktop.org>; Thu, 11 Dec 2025 22:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765490913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zjFf5L41tBDbcZuShBXTixXHD1C4nxZ3Q2igYRM27mY=;
 b=aKBw8+Ug/di1nowPoLHXjpU/wQv7XaWluU8P7EbB5pUwXb3hOPT4HoBKRBczuORjfTb2HY
 IHeMzfLn8DEXZiH9BIAD6UUWvrPpAno7p7IJ4B6pTOXilwhwHlH+P5fq3xeVgSds8Ps9KM
 JDUfd2UVPQ11tJm0cdVzeNFK+bSrjXM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-a0Hca4v0PQaTiiRVlRHwwA-1; Thu, 11 Dec 2025 17:08:31 -0500
X-MC-Unique: a0Hca4v0PQaTiiRVlRHwwA-1
X-Mimecast-MFC-AGG-ID: a0Hca4v0PQaTiiRVlRHwwA_1765490911
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8824292911cso13241806d6.1
 for <nouveau@lists.freedesktop.org>; Thu, 11 Dec 2025 14:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765490911; x=1766095711;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zjFf5L41tBDbcZuShBXTixXHD1C4nxZ3Q2igYRM27mY=;
 b=HHiyKlYfBsMCFApWxCqj1oOMZNl+dQKR0+H6npIUgWmWkpPbb/DZGL6SBB2SNBB/EJ
 IUYjvZNQ5EiszvHQpDaxDguL6AY+5Dfs7a94ZJejyR/monW263UQ4/4Q++GyoKEKLo3g
 pQRRU+5UmssCG8DkOGVSFRreMleglRSyKBOPojwq4xxvAWMkhvfIspNsYVAPZP2/6djq
 j8T9RvbWqJvHR9jTiuuqt7qTKcan5/tzatgvMV+NlfRzZYN9Jg+tlzVoJU3fFaXLZ3Ny
 pQ1b75Q8qvwElrrbvXMevkYk4YBRlkQIxkp5Ua66Bwuw8Bjj9F2kjdg4Ygn8VkpneqUj
 OVHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaD66m1p43HppNVXq1K4+34yT1z9Bm3TjbiyHwyZgrOneHej931WoKNf7fCjX3SKXAqBkOGKCt@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwlCiZ1xIk26wV5eUe9QAJ/dNmRYg3zMOD9fD/oaPDZ6ZAllZS
 SLYEzZG5JO7WC6pjHCNAgTbtLfLzDZk7M3MKnJNxJj7Qqzv9bCVJCx8KgJ1XH/i5KfBXRIWUhAH
 WwMSeiW5/YdWHX5EDKjoeczji1ph6C5E2mlbF7RcntH506z7BEBE7/x9GMfx9TvtCIqk=
X-Gm-Gg: AY/fxX54tC0FXiSZksq9fXdVUmjpt7Hb+mU64xSg26zIyhypeGkFJAKm3jLgLsUa/Wg
 7zcTMbtS0S0NndBR6lqBX9Usf4ZwnYEgwDlgDQ/6mo81laTrQEDaNZoNZogJbPhxqscDp/RkUCu
 nZ3ffERFlbDph8nRfFJL0kHj+6I3d9oU6A5ECI5TyVg2/JXgKJzwhrj+ApAmdA7Z2nwAF9EwRyV
 p8808/IbeNLQ/gn+XLAGtM251I5JJxxb1rawNKo4/dN4u/a0kg1MCVz7tQ+kUWN7XpjCni34+b3
 +awbBYSeEG9CZX/Nnugol3yoLKyX77EnxgPPtFiX11g9aDVe9CYHllXDYtuJ0yHC6rYfgppzM5x
 9Z3HahO+KPOq0pEQ/2E/hFeFbljcJjxked3r9U/7KTFGSIu+hHJqMJ68=
X-Received: by 2002:a05:6214:5190:b0:888:4930:4c85 with SMTP id
 6a1803df08f44-888715bbbdemr57238386d6.33.1765490911217; 
 Thu, 11 Dec 2025 14:08:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENTDQTVTO5abPiPnspbVewsjfe+HupVyKsPE/ZW6MQ2Op6oHfEVczT7wvjjsERpI1G70gtkQ==
X-Received: by 2002:a05:6214:5190:b0:888:4930:4c85 with SMTP id
 6a1803df08f44-888715bbbdemr57238006d6.33.1765490910860; 
 Thu, 11 Dec 2025 14:08:30 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net.
 [100.0.77.142]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8886ef0d332sm35706406d6.45.2025.12.11.14.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 14:08:30 -0800 (PST)
Message-ID: <8067808d2dda24ce27359e26653839a127eaa974.camel@redhat.com>
Subject: Re: [PATCH 7/9] gpu: nova-core: firmware: fwsec: do not require
 bound device when unneeded
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 17:08:29 -0500
In-Reply-To: <20251208-nova-misc-v1-7-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
 <20251208-nova-misc-v1-7-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U6lwtAH1zugI5oFZ5LIjxOGSDyPuBvi6Ns2U1YwkLiU_1765490911
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
> `run` doesn't require a bound device as its argument.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> =C2=A0drivers/gpu/nova-core/firmware/fwsec.rs | 7 +------
> =C2=A01 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs
> b/drivers/gpu/nova-core/firmware/fwsec.rs
> index b28e34d279f4..b98b1286dc94 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -412,12 +412,7 @@ pub(crate) fn new(
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 /// Loads the FWSEC firmware into `falcon` and e=
xecute it.
> -=C2=A0=C2=A0=C2=A0 pub(crate) fn run(
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &self,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev: &Device<device::Bound>,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 falcon: &Falcon<Gsp>,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bar: &Bar0,
> -=C2=A0=C2=A0=C2=A0 ) -> Result<()> {
> +=C2=A0=C2=A0=C2=A0 pub(crate) fn run(&self, dev: &Device, falcon: &Falco=
n<Gsp>,
> bar: &Bar0) -> Result<()> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Reset falcon, load th=
e firmware, and run it.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 falcon
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.reset(bar)

