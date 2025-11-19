Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AF8C6D0C5
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 08:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE4510E58B;
	Wed, 19 Nov 2025 07:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JXoh0Ivm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AAA10E58B
 for <nouveau@lists.freedesktop.org>; Wed, 19 Nov 2025 07:15:29 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-8b21fa7b91bso562032885a.1
 for <nouveau@lists.freedesktop.org>; Tue, 18 Nov 2025 23:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763536528; x=1764141328; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RztZt4XiHVQAhFDtWIn/8/R28dG2GfiQhQXwxaBFoHk=;
 b=JXoh0IvmfMK691eqCk5GT/n5jxAEWDn4j95mORYYrxBxX4dh2z4iwYImCzE12C8QQc
 c4n7/TSniJSks88xThKsrdcCL2/po78hQMxb9Z63RUfiINlH9KKE5sp+18DFLJExeJ6e
 4uJ5p5YMaL4ZPBL4TlEMp6gyVY9DHcM9kmJcwBCH+DiwNZMywsZVUJt3jfJXrgvAV3GJ
 1GPh++IUIzWBkZTw+WVsVe7YdlQU+h+/905ZRQJ/YHxsS5RigllruzgdUZcHYxfM66VO
 aagueu3m60lUzB2n5JHnN9//fdeLZZcTcvp/AfHRNGWeadtVjxm53hAmtsCCHtU/oQs3
 CCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763536528; x=1764141328;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RztZt4XiHVQAhFDtWIn/8/R28dG2GfiQhQXwxaBFoHk=;
 b=C69o5XcFaNL7Nw8bBp3/hFKZV/16cNr1fnA64n8r04G3S67eV+lKv8lXr2VyFwONIY
 D2oiokULNsnji69m44oQQpoE6pbEqfQqpQ8R5oEIICSi51jcatM8KU7L4NkAXRofAHjz
 e9IFHdksDMqZ9Jzq36JlbHyGIcEPe5E9jNWxzapMEe5zVSSwQxu3ByuAjahuwwiJK4oy
 JbrB1cX5n093JwpjoVsNvD6NHMOzq+LI5XRKlqOyDYHMScYa8JZIgeUUOKhwNM29yXhu
 3Ucp5z4rRYJ3rVNiHh2uknO1O0LMJbGfTY3JxDoH33w8o/CHK9/9A2qvFmI1ct/gvb6m
 ybwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP7iAoINu7S8xjT5nHShsH9Wk3VcheOGexqfzFpOngsOxitrODqSc6k3iuNBzT6EIBofdoEx8U@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/PEXPVHxgMEHFt4OybKiXCD4dqJTNSXa6bx1B3y+MT9dkxR5D
 dQm4JvqojAZkQp4SjHT5JZ5vhp8xsxRRyhPzME1ygNYT3P+de7el+ttP7WRlzdxI7qFHbd9Gg5B
 0r7+iVIsMNMu0rNdlxKWoLxzZMNZIx18=
X-Gm-Gg: ASbGncuzSR3/kvj70Ykz/7YYj/sTNayKZ3RCDNsqPtZuJuA5D7tf7h02GjWS8ELhCiN
 3UQB+8dQ6/q47gSsmesRiT0u1Vde9N1++M/jKLRFdNVgipLN/dXMiJtSQ9y/SxhkfeAIWZfhlrk
 dkq+6m6GGJ/bK3/5Rlz1KLA1pigmcDeA4ht2Tvq6lZJwT9OPIe7J2NeaG8jWnv/VTCvCLP4yMXL
 ya+XVSDm+u+AYcvgfLfitG+LnInPQsz4bG0tiQNB0qmWXppj06Z7o52PHx+rtZwesaiUZd5YUQU
 L8HF
X-Google-Smtp-Source: AGHT+IG3QDknExP/8mIQtUFmNmcMUX1vzTMPVwUQ0aAeVW3/Zos4M8agM6ps/VGUfva3me6w9arUYBckgCDdieDTCzQ=
X-Received: by 2002:a05:620a:284b:b0:8b1:ac18:acce with SMTP id
 af79cd13be357-8b2c31597bamr2209229685a.28.1763536527723; Tue, 18 Nov 2025
 23:15:27 -0800 (PST)
MIME-Version: 1.0
References: <20251106035435.619949-1-jhubbard@nvidia.com>
 <20251106035435.619949-4-jhubbard@nvidia.com>
 <ec49facbd969b1ad00acbaec1c719d3b30e0151d.camel@nvidia.com>
 <7d928fa9-74b3-4790-9e94-10cc56801fb4@nvidia.com>
 <4c87b7d6-5ce0-4f08-8f22-578a34ea2bd5@nvidia.com>
 <DECBSKQQ8SZ4.1B1D97HLUESDD@nvidia.com>
 <CAPM=9txhNyBOK2W=fgEabv3vXBscD1MNX0dyk6-OV7yCzD291Q@mail.gmail.com>
 <ff7f82b7-d812-4ccf-b5c7-263f0baaac3b@nvidia.com>
In-Reply-To: <ff7f82b7-d812-4ccf-b5c7-263f0baaac3b@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 19 Nov 2025 17:15:16 +1000
X-Gm-Features: AWmQ_bnHxY6TQMxiEW7Eu-Igfx2YIxLCLAdnQpZnqsMumZLTkRG6wcMLwie2xEY
Message-ID: <CAPM=9tw=n08NhAdFNHV7k=1CKz=nHPxu2bcXuNX8ObjAg1u+Kg@mail.gmail.com>
Subject: Re: [PATCH 3/6] gpu: nova-core: Blackwell: basic GPU identification
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 "dakr@kernel.org" <dakr@kernel.org>, "lossin@kernel.org" <lossin@kernel.org>, 
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, 
 "aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>, 
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Edwin Peer <epeer@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, 
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 19 Nov 2025 at 17:08, John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 11/18/25 7:15 PM, Dave Airlie wrote:
> > On Wed, 19 Nov 2025 at 12:46, Alexandre Courbot <acourbot@nvidia.com> wrote:
> ...
> >>> Maybe let's just do the long lists of chipsets for now...?
> >>
> >> Yeah, I've hit this issue as well. The compiler might remove that
> >> limitation in the future, or maybe we can craft a `chipset_range!()`
> >> macro that hides the messy casting, but this exhaustive listing also has
> >> the benefit of forcing us to consider every critical site whenever we
> >> support a new chipset so I'm actually not too bothered by it.
> >
> > I wrote some macros in my nova-core-experiments, had
> > chipset_before/after/range I think
> >
>
> aha, I was afraid someone was going to say "macros" out loud, at some
> point. And now you've gone and done it. :)
>
> Well, I think we probably want:
>
> a) The ability to clearly specify a chipset range, and
>
> b) For extra credit, maybe: also be able to specify entire GPU
> architectures, and architecture ranges.
>
> ...again, without too much extraneous noise at the call sites: the goal is
> to read it easily:
>
>      GA102..=GA104 | Architecture::Blackwell
>
>
> for example. Macros are going to require that to be less clean, but
> let me poke around and see.

https://gitlab.freedesktop.org/nouvelles/kernel/-/blob/nova-core-experiments-fsp-boot/drivers/gpu/nova-core/gpu.rs?ref_type=heads#L96

is what I did, but yeah probably not going to get nice ranges like that.

Dave.
