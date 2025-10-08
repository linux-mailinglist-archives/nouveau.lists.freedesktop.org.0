Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BBCCBAE97
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B9010EC2E;
	Sat, 13 Dec 2025 12:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFAsxLEG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4426410E83B
 for <nouveau@lists.freedesktop.org>; Wed,  8 Oct 2025 14:28:19 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-791875a9071so73520246d6.1
 for <nouveau@lists.freedesktop.org>; Wed, 08 Oct 2025 07:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759933698; x=1760538498; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=C3nyMQNps0AyLL97xzttuk+phB0DdoZh7JjDzOjB4po=;
 b=MFAsxLEGjCRTAdsXcqihNtVC6waBb8ZYlCNYSdQlhMwUM8A83fJpW0lpgIPTODBtrk
 FPjjNaKjD24dI8fbVDpcBBhTT90YCn6fwVMnrGk/HnQ2STGx2tMi1O+dNb+/AkunXV+b
 mFx8+0o8LMkIglLKMAgUU5lXRWpOXFIjCMqlB+aGYrT7Mg3TgTspT4+nJsqAthqvb9Gi
 ODmc78XC2Jn1v69t7tTqVyFIHmkVWlPxCGyeCWy6CCITohfuwoQk8yyjvwox9D7W8SY0
 N+sHpM7qiv/TSrdYendR4j5ss/Op4gypgH8on+NiAH/ci1naS2PHbfHNZdE9+rrmB5D7
 5qNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759933698; x=1760538498;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C3nyMQNps0AyLL97xzttuk+phB0DdoZh7JjDzOjB4po=;
 b=gFSatKeR1aZSyV3O53PCFIeknLwZRls4HmXeH7kJXgxweCH95RPHL3DtzC3p7+nKOj
 RD/tSpo1OjrTYSO8dA4xrGKtgHRzDtTGPy+MOrHAM+RYJncyKdfadjJFboglWci/GD0E
 Lqj/z8UNCk/Wp4iHCdY4FjSbmqZWlplrQRTg7NVVHU9LYmkGbQu/KqxoVN3Sooac8MrC
 xI7FupCSPGL+e5+tzTB+gXyPNxzuVrrVulK9qUju/70h+7USHwpR+p3nNxbMTu8SdruJ
 kmdu51iPC5fh2iWABvNu6m1Nl33I+mvj+f6FJ7mMOBnqAmAvhBSD+szycNiHZvtll6D4
 kPzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+KJs87q0ZTPcEL7sSiPumGylec3FuEuaixaRjDK/EGoYtxGEp0RG6LbQKnGYSyO/h4p6+Z4W2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEFL3N/mmH+dHMmhnWlBmc0do0SmMp2wdmroRl/HuvMk5z2J3E
 rMg6cjJv7dYxZIyDmrfdqcWHGc0WiLxGW+tb9y0XRm9lOadDvD50YC4z
X-Gm-Gg: ASbGncu00puOeUxg/Xyp8g4GtEwpv0BEcgRJynTBYt9YsQsx6VgJqgPqgiZYYZUviIh
 bWBtNLzTpHsXAFE52i2mkh/Hq7Z1FgFNw8NoI4Q7KF8O+18wPEri+x0T0DaNtDhhpcDfexv6uAB
 zXXM4xcXTbndWYVjBVPhKVgDxEBUnNv6Y2OR7cl4070ouIHPSqCaTWceaZskNSN8eyGwaiSKrSn
 xTRIQCe0nHWIsTOGCM+V03UXTEn0HQ5MhcxOiyUvmZcM9F+rT1/X6NQo12xiv67Sd/kRWSN0xY6
 ycDGTCP9uN2IhwIijuzJy+yJYPeXoCRKKs1S3cvnNzttwixjO/+WGWmTHMKc4P7okNeqFMGlo5Z
 Q0WQuixZ/a95RMco/sdNUm22ayWLfDnuoIOAVRVyz3SI=
X-Google-Smtp-Source: AGHT+IFntZefp3Ss0mi+6jECEAXuwb7eOj/bzue7nh8gRQKVbgbOiMWHYq2oEKWHI2USmbbKcqsDDg==
X-Received: by 2002:a05:6214:2a87:b0:789:d698:d384 with SMTP id
 6a1803df08f44-87b2103104bmr48809406d6.20.1759933697907; 
 Wed, 08 Oct 2025 07:28:17 -0700 (PDT)
Received: from localhost ([12.22.141.131]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-878be61f6bcsm163723216d6.65.2025.10.08.07.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 07:28:17 -0700 (PDT)
Date: Wed, 8 Oct 2025 10:28:15 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Message-ID: <aOZ0_7YQw81lyMWt@yury>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury> <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
 <DDC49ZIRX79X.2Q4KW0UY7WUF3@kernel.org>
 <faa99188-7ccb-4c7c-b705-3a207f5acd17@nvidia.com>
 <DDCFLM3P5MCC.NEBRVTU7X2G3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDCFLM3P5MCC.NEBRVTU7X2G3@kernel.org>
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:49 +0000
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

On Wed, Oct 08, 2025 at 12:08:59AM +0200, Danilo Krummrich wrote:

> Regarding the bitfields for page table management: Are we
> sure that we can use raw bitfields for this?

As per my current understanding we can't. Bitfields are not suitable for
direct I/O and considered as a data storage. In the current scheme:

        regs::NV_PFALCON_FALCON_DMATRFBASE::default()
            .set_base((dma_start >> 8) as u32)
            .write(bar, &E::ID);

we account for endianess in the .write() method, which would be a part
of register API, not bitfields.

FYI: ARM64 is in process of dropping BE, and Linus announced the end
of BE support for RISC-V:

https://lore.kernel.org/all/CAHk-=wgYcOiFvsJzFb+HfB4n6Wj6zM5H5EghUMfpXSCzyQVSfA@mail.gmail.com/

Thanks,
Yury
