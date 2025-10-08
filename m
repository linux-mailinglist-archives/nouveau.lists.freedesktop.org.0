Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A82CBAC85
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BE110EB8B;
	Sat, 13 Dec 2025 12:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXNgv9iO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7058210E1DA
 for <nouveau@lists.freedesktop.org>; Wed,  8 Oct 2025 16:57:05 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-27ec3db6131so58325ad.1
 for <nouveau@lists.freedesktop.org>; Wed, 08 Oct 2025 09:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759942625; x=1760547425; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BtxsZvw7ZUfiZlsMlvMyfedw4t0xzCAElKBhmmA01y8=;
 b=kXNgv9iOqUCM2MZT+tXSj+widJYBO1qLuIl4C5+MZsk0bHVmlkrm+Rm2m/o7cWcdtE
 Fyb3Ka4FX8h/4fd90AD12IKoQBSGOeXZqR52Ybo6C1/gdzBqykIARf0bqgMCwpBIZDB+
 UfFXz0h3+NxOa4HQvfOzvKfYC7X4sZCdXV4LCaJI4fyrBjNE6t/HLSurgBMlKDHZiDNQ
 GZLRoK30fdzqCsw8Q1jtBLLhCj24Htg9Thas+XhOp+lDse7uKp8Cz3lZvUusZ7GMqJUu
 eVVMjmzfdL/FPtQdXAyraj/vFbY/5otf/0+htbGiOpaeYVKUVjhhM1ihMMOFrYWrA5sY
 ZZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759942625; x=1760547425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BtxsZvw7ZUfiZlsMlvMyfedw4t0xzCAElKBhmmA01y8=;
 b=MXxY+UbZgt0S/ox1G/Aq6FmxzfoF6otZmwyNqVpQcbzi2iO85qaEvaGbxOWdABX5P/
 L/VXkZjSLi5nZzyGxGab3y6i1nu87UNIcT3qUNlOxD3Tx/UvgovA41vIcYkhgjheyi/B
 7lq9Dgmugt8lIxe1CHutKDAiuMxR8wandgFTKaJGQFzS01+yvPPGAeR5DDjkpjr2Odvs
 S5Ok2E2wDRjylTWnyqBxw8mXoVrkjmHEp0qn6lYgE9spi5Zjrm5scuW2aJTDD3RoJ5A2
 1/flv82WkYruIGLnf552nQNrrHh/Wf8y4G0sCpZa6nxpYl1unBWuyMgYkraGtkrE/NX9
 gsjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjzD0fodnQVOQme+y5s0qlPWACsoZI/7U3LagBE3rW0Y8Qa3ITcsVl1C2bSx/Nx1K82j5VWA5I@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTK7fuGVWxIyVrc3RvmPgC2HBC+AZyYkELl5RPk/Zo4BtXC9LC
 mcDXDiaKO6EtH6b9QbIIbheuV68FdJDgZMHNgHI0+rknCSNBUhYYbr+5ojs4wgwkDKoCUgLiDqy
 5q6G5l+WYD9j8b0uI+0vynUoTAgt85ZM=
X-Gm-Gg: ASbGnctRHehPaYlr37WN9lCiu/gh9awwBk7fdX1oGLObw4JIQUrAUDyvZqyShanP6Py
 joTdlO2EfEhuTJR9p9LKcHJgUhakfN+it3dBBeFh0YFQMCDnuuJCZ7kIlq1XA6ZvkneumOEQQfe
 KiEetcwae4BstElUbp50E9VBxuVXIiTeEto9rEJGeo9C+sOg582auJ6/ipR4ypzTqMh4WjKmlfX
 gc0xD9N5cr+I0ZKnbkSCk4knZE2aAJwfNClLI5KtEJQMdQmMLKzqU/zt1Bc8vCJd6kATbEiPpH5
 EQBGDctAAjxg41XOk8n4jv+1Pp740z0LHgVyxhcLnPhc/EOQ4w==
X-Google-Smtp-Source: AGHT+IE+hV5XvZK2LLA5Zj8MS65c8DKZNoLYsUmppQ2+DVDFH0vWuOn4hQEUZM9Ru/QEpwQVpwGiPDgdVyGxI0qTssQ=
X-Received: by 2002:a17:902:d4d2:b0:25c:9c28:b425 with SMTP id
 d9443c01a7336-2902745c0a2mr34349905ad.11.1759942624756; Wed, 08 Oct 2025
 09:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251008001253.437911-1-apopple@nvidia.com>
 <20251008001253.437911-5-apopple@nvidia.com>
In-Reply-To: <20251008001253.437911-5-apopple@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Oct 2025 18:56:52 +0200
X-Gm-Features: AS18NWBIne5rc-AVIeVWCfebGQh2r5eidrg652ppzGpIdVO4I8s2bzW85Um8QvY
Message-ID: <CANiq72k5f3f8Kys40sRmaKR8eeq8-4DsDkWDkwMPZ0A1JSFj8g@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
To: Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, acourbot@nvidia.com, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:48 +0000
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

On Wed, Oct 8, 2025 at 2:13=E2=80=AFAM Alistair Popple <apopple@nvidia.com>=
 wrote:
>
> +/// Example:
> +///
> +/// let mut buf1 =3D [0u8; 3];
> +/// let mut buf2 =3D [0u8; 5];
> +/// let mut sbuffer =3D SWriteBuffer::new([&buf1, &buf2]);
> +///
> +/// let data =3D b"hellowo";
> +/// let result =3D sbuffer.write_all(0, data);
> +///
> +/// A sliding window of slices to proceed.

Please write documentation in the expected format, i.e. using a code
block and a header:

    https://docs.kernel.org/rust/coding-guidelines.html#code-documentation

Eventually, this documentation will get rendered just like the
`kernel` crate (and the examples building/running as tests etc.),
which requires following the expected conventions.

By the way, is the sentence "A sliding window of slices to proceed." cut?

Thanks!

Cheers,
Miguel
