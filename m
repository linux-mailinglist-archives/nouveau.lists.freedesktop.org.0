Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37659C6C8A0
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 04:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4EB810E55D;
	Wed, 19 Nov 2025 03:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e2kcuc/k";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5CD10E55D
 for <nouveau@lists.freedesktop.org>; Wed, 19 Nov 2025 03:15:55 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-4ed7024c8c5so46369501cf.3
 for <nouveau@lists.freedesktop.org>; Tue, 18 Nov 2025 19:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763522154; x=1764126954; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZdkFpA9LcDgJX0rBlic+VP+aw8vNvuzktSwkK96kTPE=;
 b=e2kcuc/kgJOJD54h88+E9e6eOXn/9Y1P24IUNn6PoWF+YNnWpWLlu7Ijz+GuV+c89M
 IfLGXDJx9Oey4ih05PiB2vx8IjmaO/SOuvyHEKJMp0HOFUEEsDmSBBPyVEQjgWsNSBtf
 dtJnXC+SnUAHWR/aW+CXZdnlv9WkL3q2PcqSCylSAlI6ML7jEkg4UsAQZuPnN7tnO7cO
 SRKztrh4rhwkrguNYVc5iy0YJmqVX68JwypuI6UuWvHOalMM+frk5UWdzF2l7efCjBTU
 DintD+puvtQ5mv5xy2pM+oEOw02hHhcq7JerHOIvrGYcd2JbqqOeQT2wzpAkmK1PNUEt
 5/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763522154; x=1764126954;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZdkFpA9LcDgJX0rBlic+VP+aw8vNvuzktSwkK96kTPE=;
 b=uBMdUFL3X05GvH9Gcyu4Gmv/U6NmwLbYqHPG5TLjyXKe4/nKjiZT07ihczBkAu3kXt
 pCqn00ybE5rUJfaZs8t6uMsnzGVJh0691ZEAPChZ+sgrPx6nT7ZKIWOOX5sS+lnWanVV
 eh3fQHqUz2HoR+fAyM04VIv7ggeHuTl8RcvbdyjNhkfBu39akLA9i2SqqMQUjD6o10y4
 qlvKwchHFXMTP3vBco1wHHpDvVwtx4BaD0IC30rORdbdxkH0nDPampK5OMI9LQRwja/Y
 almXOU7I3s51Ud42G6OlwUlNmuj6BuHacT22ujXplRA/PZkQbFM4Lmpr5X/+22Bjve32
 6eCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkpPBnFRX+HCAwchXmIXDCAN9aB7lPncubuTb5Wkkq0a5C4sQisT3EZgJBwELkzda+2GQ1v5GI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRAEIp6KIEOXTw44zQGZUV/QPmUnKCzTgRtUp08q06PVOosprP
 LSyIPMywvlL4uK+j1ylSOgcuqeOnl448qECklYnh8Ou5J4X34IHQtJvuCOFpJ6QyKZ0ZOZTaL3t
 evtiHtfQd2wnYIoO+X1VrHP5l0EMixQ4=
X-Gm-Gg: ASbGncsNqbXTlqkTujysxS3JXhZy06txPtyOl/eHwwdaylHnur8W644AK/lLPn5R5kg
 OIu4XmyXH60KhPGbPmTRxA3z7qpCjrJ63cqsWMqTlJFNlcG9OErPYKIWrWZ+jj4sWiUk9kwTQTi
 dcJwmzo2SIKvaLApjO8dFOtwQYpr8nlyMA7Y1QRj6tPlz1ajNEOWdHdcsiKyMDNappOD/cYEp0b
 /canA1159U2SMZPMN5hQjxNagcWb/vbhbPdDRUFPCIgcYoMU/rsHgnc+4CjAlke00r2Bg==
X-Google-Smtp-Source: AGHT+IGeDZHTrPjqqdp3o3sxjOKCtQBz7sj/TpB6Z6nlFrDNsPxslnJOd859WIU5BNxRnzFzEuPJZ0Xqs+h4S1i7AE8=
X-Received: by 2002:ac8:7f51:0:b0:4ee:1c3f:ed27 with SMTP id
 d75a77b69052e-4ee1c3fef41mr122957391cf.17.1763522154435; Tue, 18 Nov 2025
 19:15:54 -0800 (PST)
MIME-Version: 1.0
References: <20251106035435.619949-1-jhubbard@nvidia.com>
 <20251106035435.619949-4-jhubbard@nvidia.com>
 <ec49facbd969b1ad00acbaec1c719d3b30e0151d.camel@nvidia.com>
 <7d928fa9-74b3-4790-9e94-10cc56801fb4@nvidia.com>
 <4c87b7d6-5ce0-4f08-8f22-578a34ea2bd5@nvidia.com>
 <DECBSKQQ8SZ4.1B1D97HLUESDD@nvidia.com>
In-Reply-To: <DECBSKQQ8SZ4.1B1D97HLUESDD@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 19 Nov 2025 13:15:43 +1000
X-Gm-Features: AWmQ_blBiOF3xgOhXiBt3avEraQ-3HOhBcxTdL-0cZbCju_5ZMqtH5u8L8OOHUE
Message-ID: <CAPM=9txhNyBOK2W=fgEabv3vXBscD1MNX0dyk6-OV7yCzD291Q@mail.gmail.com>
Subject: Re: [PATCH 3/6] gpu: nova-core: Blackwell: basic GPU identification
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
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

On Wed, 19 Nov 2025 at 12:46, Alexandre Courbot <acourbot@nvidia.com> wrote:
>
> On Wed Nov 19, 2025 at 10:46 AM JST, John Hubbard wrote:
> > On 11/6/25 2:24 PM, John Hubbard wrote:
> >> On 11/6/25 6:44 AM, Timur Tabi wrote:
> >>> On Wed, 2025-11-05 at 19:54 -0800, John Hubbard wrote:
> >>>>       let hal = match chipset {
> >>>> -        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
> >>>> => {
> >>>> +        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
> >>>> +        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
> >>>>               KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
> >>>>           }
> >>>
> >>> Maybe combine patches 2 and 3?  Also, maybe this should be a range check, instead of listing
> >>> every since version?  It seems like everything past GA100 uses the GA102 HAL.
> >>>
> >>
> >> Sure, I can combine the patches.
> >>
> >> I'm not sure why I've been wary of using ranges for these arch's.
> >> I'll try it out.
> >
> > Now I know. :)  Unlike C, Rust does *not* like it when we try to
> > treat enums as integers. Casting or other (messier) approaches are
> > required, and in no case is the end result a more readable on-screen
> > experience. At least not so far.
> >
> > It is possible to mix in Architecture (Turing, Ampere, etc) checks,
> > but I'm not sure that is worth the additional clutter.
> >
> > Maybe let's just do the long lists of chipsets for now...?
>
> Yeah, I've hit this issue as well. The compiler might remove that
> limitation in the future, or maybe we can craft a `chipset_range!()`
> macro that hides the messy casting, but this exhaustive listing also has
> the benefit of forcing us to consider every critical site whenever we
> support a new chipset so I'm actually not too bothered by it.

I wrote some macros in my nova-core-experiments, had
chipset_before/after/range I think

Dave.
