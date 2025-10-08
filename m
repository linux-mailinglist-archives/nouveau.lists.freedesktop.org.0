Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44809CBABAD
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EF110EA71;
	Sat, 13 Dec 2025 12:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/ysVkJ6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0491210E847
 for <nouveau@lists.freedesktop.org>; Wed,  8 Oct 2025 15:49:57 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-54a98bcdedeso1499225e0c.0
 for <nouveau@lists.freedesktop.org>; Wed, 08 Oct 2025 08:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759938596; x=1760543396; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=posWhcO7uW0YnkFBpk/sI6hl5Osok5DPG0Lk6uuLAiY=;
 b=E/ysVkJ6PYV+F31rykG30SPINdTt8xV3oAtp6XZJiHlDiD8JFvZW9xxdF/7BiFx+4C
 TNbIEtpikA6zFEBTvPfaSZnwVpBSg29sYMrKIQlDRlfLxn2dUCgq2cWkHlBA1upgnZK/
 I7WH4ZrLo9Qzu30lct/T+1vw0WL+00DgIofsRh2XedejfkcQf0joe4W9WWzp99vr5Z6T
 xGP+yhvFgomRX08kTwglJYmD7CbWfUIUtElUATBfSOZodGL+0d6mMURIQnZVxSm++dhR
 r5Ct56TKXCksB2URh8vr05tQuCbZpkpCbU+PC+h18GRDoysToYUygxoI88sZosHI6enD
 Gg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759938596; x=1760543396;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=posWhcO7uW0YnkFBpk/sI6hl5Osok5DPG0Lk6uuLAiY=;
 b=dHtRWx7DPD7xZ1ooCVZ7+BVFq+56eeerpg/XBtGhhFTqnaGREVuhDnNxHyZU31BGTR
 RTrgLjHnUqq2842DGvTiF/XDEe2Rl0KZ7/164AkHbvf4Z06H2gOOGiBrNM/D9T1z8k8O
 5TgobHHljvyFNqOA16WLPD8pUkK+EAYK1NliUxjdZrSExfx1mUbiVf95hXrgXr3oxN/v
 SjB2GeCin28DLBPjKt+O/f0xvAWbhRYyX/hNHPBA7/SaNVwpJ9O+LeBzFlGKUzZ6fQpt
 Iw3VbZTCgDY58Lv+mDmYeeIcuN4L5mBMU1xVX3p4LbzF77u7Jtjg2rHVlxz4M6cs40RB
 ppww==
X-Forwarded-Encrypted: i=1;
 AJvYcCULUapYoFeunapyNdbiRXCQfqCCM/qr488L7QIHTdg8LZj85MqWTNG9/QgkpmJA0tJ1nisZ+xib@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTPmXNMUp+YtdsvAHqLMR3c91RsI8kjyaAoreVIkEDRggTZalj
 Gxn32RVpXaaDWzCjSFCZ5psXUvGTMbcCslbdZzyeJnpuXHcmC4Ft/Iqe
X-Gm-Gg: ASbGncuabOoGmb0P7s9QBmh5iq6OGIif9/wgK5AlSEAu+nYbfsqysLmSW4gFPldKsPg
 VGkdFySI3pSzi3nz3uVjwIAONo15MSfVIkA+P/qdAypvMP/w5qycPT8/lYsbWlCuzd6HXvme/Ry
 ATonWixLrZts+zQN7aecEsQ00k/tCR/BRsNvOvq0T37U4nNGANevnoVTIeGUNGyxQhfE5nodWeJ
 s+67N/UL5MibWFTm0U+RU9KlGOxUaYZ5p6I82YkkTAiDncO2nemH8FCa6L5cKQJwOxRG9bkvj40
 2ELi4ZPiL5uAPuVUv5AaIErrZq9nG2JTXnf3bvTJKaGF8dRjPC+de9OFv11VF+9wwY+ow1VATF9
 zgeD+YYsMMzczHg74w4tcagjLCyn5hau+nY4XqGiNLH0=
X-Google-Smtp-Source: AGHT+IEJ9vfvjdDQtiPcrc3cIELW9OyuJZ/EAGgmwTi4uspcOFQieo0RXuDvRCYp8d25pdpbu0sCBg==
X-Received: by 2002:a05:6122:a0a:b0:539:1dbf:3148 with SMTP id
 71dfb90a1353d-554b8b3f3f8mr1700186e0c.2.1759938595679; 
 Wed, 08 Oct 2025 08:49:55 -0700 (PDT)
Received: from localhost ([12.22.141.131]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-55497ee3001sm2300503e0c.6.2025.10.08.08.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 08:49:55 -0700 (PDT)
Date: Wed, 8 Oct 2025 11:49:53 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
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
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Message-ID: <aOaIIV8KDA0GjF6E@yury>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury> <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
 <aOU0joJQZiU61GBB@yury>
 <D421296D-FFF3-4998-B467-8E079AEB7499@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D421296D-FFF3-4998-B467-8E079AEB7499@collabora.com>
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

On Tue, Oct 07, 2025 at 06:41:58PM -0300, Daniel Almeida wrote:
> Hi,
> 
> First and foremost I’d like to say sorry for not having the bandwidth to
> chime in here earlier. I’ve been pretty consumed by Tyr itself lately.
> 
> > On 7 Oct 2025, at 12:41, Yury Norov <yury.norov@gmail.com> wrote:
> > 
> > On Tue, Oct 07, 2025 at 07:36:21PM +0900, Alexandre Courbot wrote:
> >> Hi Yuri,
> >> 
> >> On Tue Oct 7, 2025 at 7:29 AM JST, Yury Norov wrote:
> >> <snip>
> >>> Regardless, I don't think that this is the right path to move the
> >>> bitfields into the core. The natural path for a feature that has
> >>> been originally developed on driver side is to mature in there and
> >>> get merged to core libraries after a while. Resctrl from Intel is one
> >>> recent example.
> >>> 
> >>> With that said, I'm OK if you move the bitfields as a whole, like you
> >>> do in v5, and I'm also OK if you split out the part essential for nova
> >>> and take it into the driver. In that case the bitfields will stay in 
> >>> drivers and you'll be able to focus on the features that _you_ need,
> >>> not on generic considerations.
> >>> 
> >>> I'm not OK to move bitfields in their current (v6) incomplete form in
> >>> rust/kernel. We still have no solid understanding on the API and
> >>> implementation that we've been all agreed on.
> >> 
> >> Initially the plan was indeed to give this code some more time to mature
> >> in nova-core before moving it out.
> >> 
> >> The reason for the early move is that we have another driver (Tyr) who
> >> wants to start using the register macro. Without it, they would be left
> >> with the option of either reinventing the wheel, or poking at registers
> >> the old-fashioned way, which I think we can agree is not going to be any
> >> safer than the current macro. :)
> >> 
> 
> Tyr could use both register!() and bitfield!() today FYI. If you move it out, I can
> follow with an actual patch to do so.

Not sure I understand this. Does it mean that you have use cases
for bitfields unrelated to I/O registers? Can you please share
details on what you need and sketch some examples? Particularly,
do you have arrays of bitfields in mind?

If my understanding is correct, then I think the strategy that
meets your interests at best would be moving the registers out of
Nova earlier. After that both Tyr and Nova people will get equally
involved in bitfields (and possible BoundedInt) development.

This is what Danilo proposed in the other email, and I agree that it's
the most structured path.

Regarding timeline, I think 2-stage approach will eventually become
faster.

Thanks,
Yury
