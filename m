Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F64ECBA8CD
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B7010E404;
	Sat, 13 Dec 2025 12:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="PC0qEdHG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EC710E2D3
 for <nouveau@lists.freedesktop.org>; Mon, 24 Nov 2025 14:01:05 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4eddfb8c7f5so37621341cf.1
 for <nouveau@lists.freedesktop.org>; Mon, 24 Nov 2025 06:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763992864; x=1764597664; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K/jxlDz9BAO9kydkpl4fCic8ClBRjihhesEG6s01glE=;
 b=PC0qEdHGX57BKdk3mmAFU27Wq01axIZgckgJC+k8Bkm0zbLniiQqEXaduE96RPwBwZ
 i2n9FuI3xpBBzguebPQXDiSZBhfBTv9SfS3qi7TDy0qliYRNiLGjQkHWlP582qvlojby
 7UKtPuyNlQHypfgBQZlYxhaNjamHcgdS4HoXjpHjWLvmZt69JEazdPcXK10LtJVQb4lU
 eh661KrIxy66PzoUHu7u/FvAmXAxJSg+ZmdRJXmjFKixkJHU3U+OXKRnvDDJyiJqcIb7
 DE2sHEHAwDTAObS2UNQLtlmnvN9MLvtw5cMmICU3ILsG47WrcNUrX+TnXu1gmRewDIcL
 4acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763992864; x=1764597664;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=K/jxlDz9BAO9kydkpl4fCic8ClBRjihhesEG6s01glE=;
 b=oX2vjdTj/ge4EQeTHjIDRjS3cBf1XH1K7mi9axj3oa6jA/tVLgKXmCb345QPTaKI6c
 rOrEzHpJyu7vJjDUU6i6ogU7BOG5Lx7TQKYYbNCTMnK42kP91B/X7+sm6iP8vsqrw5JD
 KdYJGQ6wzuMyDyzX2AyGDQ1fvrlnzQY3rVCoMujT+K7EGE9JhorTckam/sGhkBI1bdY3
 7Gj6gO04WGTOZIHXF6cqyH4HO8TZAsUFQYrL5mLtZOwvlMS1lYy4KvHLQgrw9HfqqtB2
 mUAP0X5+rNi20a5GG3fzWtCr2jrffJ6VbX8fzs0FEsQf/vkPpSQhhimAHiKJrFM9PBzL
 +QOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqwLA8womYYP/AQuMKp6cRtktAq6lyjmqdnzwvGGtHhXyPqUA4SotrJ89yWr9THTPHbjiTaq3y@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhqctyEVy1zmIjR0VYq6PS351/sQC1SB/kC73suQsEy7h240X0
 fJyQ9OHCr79cd2m43fCWKX26ugmw9/56xYGBgH9NqoHythJt8ITSg0Kg
X-Gm-Gg: ASbGncso46aCiguZUYAC2Z4dA3WBhn+0IrnT+FHu7XchMKsoR3faFeqNOTUySOfnS7K
 uOW2DRrLkPq7DasdD79Pedaz0yCCNPUgpsKl7/K82dyn+D5Zdu8os7wDRXtGghSSAHcRX5zcDun
 wUyNSRD3/Ql1DCB4Tesyp/PrvbXDkoW8ghy2KSTXlzaOLLu+60GM3T3ad4l7Xssu20gJ/bk1x7E
 0d7ON5xZDfgzmODVnDzm0ospc7caUAD1CqQhSWkvf5AQ6HX8UO8RcKRW2iTrHMlOXIDKGdiYHhm
 rliPeT9saY75qcYzLeNCu3+R8R77w09qzpyGGF6ZbQpzGcTn0giYj0fPvXCJf1a55i3KEQhhom2
 PciFtOn9Jro1OAPyisE22Klslh7gVcOJ0JwCQj/dDS8yq+D815sR2ekrdwX68uTdAdMCx74UI7E
 VElaWP/9M0w6uT6x3A+LHhKte66Y2aA7lUlei8jLA5f1ppHQ1kCR/Y0rPUR/7F5PFg8MS9LR9Uc
 c4TYbv1L3fYQVY=
X-Google-Smtp-Source: AGHT+IFrrXhu6AJfyliU/Xzg3MThXEUzI8ZAPUU7ipyQF52eo/ZMchMrcbXBykYYxmEfwQPHrKxvsQ==
X-Received: by 2002:a05:622a:89:b0:4ee:1f5b:73c3 with SMTP id
 d75a77b69052e-4ee588b5258mr166800441cf.60.1763992855573; 
 Mon, 24 Nov 2025 06:00:55 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee4cbc3c81sm78152051cf.16.2025.11.24.06.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 06:00:55 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfauth.phl.internal (Postfix) with ESMTP id 5A591F4006B;
 Mon, 24 Nov 2025 09:00:54 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Mon, 24 Nov 2025 09:00:54 -0500
X-ME-Sender: <xms:FmUkaRi8XRZ7NjmS5aeRh4-Jm1Pfv8hgGzNPpz_5YeA1tYOE41UXfw>
 <xme:FmUkabPthiPCpHANWDH3BhuF6r9lJNXRf9zF_XsmtbzvH7P9H9FR0QMQ1JEuawC6f
 pbd79UfL_3nWTVMtqoFU5nrQDfdHYmtxS7eAe_n2tBGNKaIO8i6kQ>
X-ME-Received: <xmr:FmUkaUePcNTfbNXU_ioiV3mYYPKLFXpFLx5lT86L_rAH17KxgRIBvxosI6S6qcNHjRZ87CsubsdzQrh4lHfN1ufZAFu1_DiT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfeekjeelucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
 hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
 gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
 hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
 udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
 gvrdhnrghmvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgt
 phhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsfh
 hrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehtghhlgieslhhinhhu
 thhrohhnihigrdguvgdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprh
 gtphhtthhopehhphgrseiihihtohhrrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgv
 rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnh
 gvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgv
 rhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:FmUkaVwKOdqs2hd1c5mVJwNjIzEk-ZJZjGbua1gEney0XsqYgUup6Q>
 <xmx:FmUkaZ2k42CgQZqenqRYQSlyFeJ03Aygp_PdeG-WqjDRQMnSmlNuog>
 <xmx:FmUkacekbu74JBnu_PLPfiu5XuLSGuPZCk5dY7M85Eo5cWCmkWTMWA>
 <xmx:FmUkaeWDVqlM3N7_rjUHHvB9Lm6nW8m9EwwnRZn-ig3h0D8kxtoCpw>
 <xmx:FmUkaU_7pojGQ_Cqb4E_n5iaqsuoY7-Os-7iD2I-3WKtSqb9HUGHKYB7>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Nov 2025 09:00:53 -0500 (EST)
Date: Mon, 24 Nov 2025 06:00:52 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 ojeda@kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <aSRlFB9PoOcZVmvt@tardis.local>
References: <20251124231644.38d0303b@canb.auug.org.au>
 <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:17:01 +0000
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

On Mon, Nov 24, 2025 at 01:32:49PM +0100, Peter Zijlstra wrote:
> On Mon, Nov 24, 2025 at 11:16:44PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> > 
> > ERROR: modpost: "NULL" [drivers/gpu/nova-core/nova_core.ko] undefined!
> > 
> 
> Rust :/
> 
> So I have:
> 
> $ make O=tmp-build LLVM=-22 allmodconfig
> $ make O=tmp-build LLVM=-22 rustavailable
> Rust is available!
> $ grep -e CONFIG_RUST= -e CONFIG_NOVA= tmp-build/.config
> $
> 
> Help ?!?
> 

[CC nova]

On my system it seems that RANDSTRUCT=y prevents the enabling of RUST,
but I'm sure Danilo and Alexandre have better ideas about how to enable
nova-core.

Regards,
Boqun
