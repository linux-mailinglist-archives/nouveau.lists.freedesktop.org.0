Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3944FBF9AD2
	for <lists+nouveau@lfdr.de>; Wed, 22 Oct 2025 04:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D0010E68D;
	Wed, 22 Oct 2025 02:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c26vvOMh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDFA10E0C4
 for <nouveau@lists.freedesktop.org>; Wed, 22 Oct 2025 02:09:11 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-279e2554c8fso58987585ad.2
 for <nouveau@lists.freedesktop.org>; Tue, 21 Oct 2025 19:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761098951; x=1761703751; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=af9vNF4/pOmtn3q/j2U/NQMJF3YjAHP3FBPyaTm2ZTY=;
 b=c26vvOMhu5d7gvx9Gg5sKzAX4ZNFTR7HLJhDmRPtvamZ0D9674pu+mqr3e3oZtqvay
 OdRLLzgPv/XfzLLCui7MduiS694A9sPTJnmdb5ajCiqV5Jgfgn4TZ1m0a/jQuj7O0Tk6
 t3kYol6qczfh9a4xjpq+p9RYrT83baEhI97oDg9GpCNUQ0HEw6FI7AZSEr22O9dtLe/j
 oB8A9GLBcKY33WD2sZShUV6bumPnl2ktkJjyuh2GQzg2g2kbQ+7He+9AKzetr5vCHrzE
 FBORrV0og9Mf7dQC0DqzMNzJfCnXz04hEXq2esW9VmCCp3KOTtZb1hxFHdUOP3lUOC4L
 7smA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761098951; x=1761703751;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=af9vNF4/pOmtn3q/j2U/NQMJF3YjAHP3FBPyaTm2ZTY=;
 b=WQu3A/+LVXmLsoKd5cEPU23e7Fn2aOmFqKFHkBWQnWglPp6FbW+xcoIAAc50w12alz
 jmnLSa0xeyhm1Hip24/kH+3mdN89SWZ2UkmfEPYeJeyzE+FBQI7By3A4ENLlv1P3uFbs
 ZTty/WexbjPjI/hrQHnqhGufUtcILcxJq4DmBnSH6n2C+jGIx6sdyHHpMSNYPvdvCvka
 WxnGRO/P9w+IIFjl+eXnrOd1xKNI/KTIbpk962525q1m4XAdJfBIRINM/cLE2Xjpqnow
 Fh6gAzr5Wxp7nOErjav3cuFr5b4wpTmd7/vnXtIrfT8ERzmrJOeBgIdwdcrehHxR63MN
 bR8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7pRN5sQXCr5lCRJTK+M7sotKRlVG3mcalpXw34UKnBgGQvsc+fR8H7yHMybKdBhSV6HdWmvqc@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvYYN3dxU3J8lqjF1Pl+CAGGAwHZy3fJysRP2hjwg29YcMGWVn
 g+IUAImCpL25T8ABEURCIB3aY2URwxdA2s+i2vR5Xd7yigXjZzArJXFg
X-Gm-Gg: ASbGncuVf30FGVY/M64n4pj/UWsnarliE+AcfG/3e9l5ZVMhd/BmdoV1mmwuz9v2tEn
 e0Dgx4mwy0AeBoKG7d4UewSGrPy445RIb0wG3Yngz9mIdAvpJYIOyi1kFQsXXqu1UmktG1ccYzP
 xAYDB/cLRB4eYdMt2p2MaB96S41UnH9GjGHgEpe14OenCL4fW89DBV2rKBTLhU3LKUR8TkIS9Ge
 3Pu2PzGHGXo3nUdqCgvLt/VAMK/D7/eyjfCiA/zBn6Pg3kdbS7rKicRNZFdfsmQi3HBzkEP52zq
 uce2mZLCKx1SH8nVrqjgK+gvLxAOE02vsIjWIVzFzVO3hvWyYk7vfHwinb8ZVwLQf0waFntDfkI
 kwlDKpqg51naWTg8wD6EDgp1MYHjbOSUDKr54Wq6S/pUMAnutnqb0GLbvNPkxpwpmLnfs6NO3y6
 sXAgtZIZDud8Ki
X-Google-Smtp-Source: AGHT+IGoV41dxt0PTAHkgRAIyZFYB8ISFOdcqUyCiizLarhiL6pLGFIW2lB0KpZYTkg47fD50y0GNw==
X-Received: by 2002:a17:903:b90:b0:276:d3e:6844 with SMTP id
 d9443c01a7336-290ca1218cbmr205757685ad.33.1761098950545; 
 Tue, 21 Oct 2025 19:09:10 -0700 (PDT)
Received: from archie.me ([103.124.138.80]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471feb99sm123086345ad.87.2025.10.21.19.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 19:09:09 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id EB4D34209E4B; Wed, 22 Oct 2025 09:09:06 +0700 (WIB)
Date: Wed, 22 Oct 2025 09:09:06 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
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
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 4/7] docs: gpu: nova-core: Document the PRAMIN aperture
 mechanism
Message-ID: <aPg8wuF5ZodLxOH0@archie.me>
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-5-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WWOwYHGjzVps0pxd"
Content-Disposition: inline
In-Reply-To: <20251020185539.49986-5-joelagnelf@nvidia.com>
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


--WWOwYHGjzVps0pxd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 02:55:36PM -0400, Joel Fernandes wrote:
> +The window position is controlled via the PBUS BAR0_WINDOW register::
> +
> +    NV_PBUS_BAR0_WINDOW Register
> +    +-----+-----+--------------------------------------+
> +    |31-26|25-24|           23-0                       |
> +    |     |TARG |         BASE_ADDR                    |
> +    |     | ET  |        (bits 39:16 of VRAM address)  |
> +    +-----+-----+--------------------------------------+

Shouldn't the TARGET field cell above be fitted (extended)?

> +
> +    TARGET field values:
> +    - 0x0: VID_MEM (Video Memory / VRAM)
> +    - 0x1: SYS_MEM_COHERENT (Coherent system memory)
> +    - 0x2: SYS_MEM_NONCOHERENT (Non-coherent system memory)
> +
> +64KB Alignment Requirement
> +---------------------------
> +
> +The PRAMIN window must be aligned to 64KB boundaries in VRAM. This is en=
forced
> +by the BASE_ADDR field representing bits [39:16] of the target address::
> +
> +    VRAM Address Calculation:
> +    actual_vram_addr =3D (BASE_ADDR << 16) + pramin_offset
> +    Where:
> +    - BASE_ADDR: 24-bit value from NV_PBUS_BAR0_WINDOW[23:0]
> +    - pramin_offset: 20-bit offset within PRAMIN window [0x00000-0xFFFFF]
> +    Example Window Positioning:

Move the supplementary explanation out of respective literal code blocks,
like::

---- >8 ----
diff --git a/Documentation/gpu/nova/core/pramin.rst b/Documentation/gpu/nov=
a/core/pramin.rst
index 19615e504db9d5..47abe539e32a81 100644
--- a/Documentation/gpu/nova/core/pramin.rst
+++ b/Documentation/gpu/nova/core/pramin.rst
@@ -70,23 +70,28 @@ The window position is controlled via the PBUS BAR0_WIN=
DOW register::
     |     | ET  |        (bits 39:16 of VRAM address)  |
     +-----+-----+--------------------------------------+
=20
-    TARGET field values:
-    - 0x0: VID_MEM (Video Memory / VRAM)
-    - 0x1: SYS_MEM_COHERENT (Coherent system memory)
-    - 0x2: SYS_MEM_NONCOHERENT (Non-coherent system memory)
+where TARGET field values are:
+
+  - 0x0: VID_MEM (Video Memory / VRAM)
+  - 0x1: SYS_MEM_COHERENT (Coherent system memory)
+  - 0x2: SYS_MEM_NONCOHERENT (Non-coherent system memory)
=20
 64KB Alignment Requirement
 ---------------------------
=20
 The PRAMIN window must be aligned to 64KB boundaries in VRAM. This is enfo=
rced
-by the BASE_ADDR field representing bits [39:16] of the target address::
+by the BASE_ADDR field representing bits [39:16] of the target address. The
+VRAM address calculation is determined by::
=20
-    VRAM Address Calculation:
     actual_vram_addr =3D (BASE_ADDR << 16) + pramin_offset
-    Where:
-    - BASE_ADDR: 24-bit value from NV_PBUS_BAR0_WINDOW[23:0]
-    - pramin_offset: 20-bit offset within PRAMIN window [0x00000-0xFFFFF]
-    Example Window Positioning:
+
+where:
+
+  - BASE_ADDR: 24-bit value from NV_PBUS_BAR0_WINDOW[23:0]
+  - pramin_offset: 20-bit offset within PRAMIN window [0x00000-0xFFFFF]
+
+Example window positioning::
+
     +---------------------------------------------------------+
     |                    VRAM Space                           |
     |                                                         |

Thanks.=20

--=20
An old man doll... just what I always wanted! - Clara

--WWOwYHGjzVps0pxd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPg8vgAKCRD2uYlJVVFO
oyuoAP9SK55E2tSNnoxS1S+ANBUsz0CHN3jIoOgeS9ZQB8q9dgD/diBfYDATtQIi
6xSU72ZYmtPwjX3snJKLeHqpNqruDgk=
=zVnz
-----END PGP SIGNATURE-----

--WWOwYHGjzVps0pxd--
