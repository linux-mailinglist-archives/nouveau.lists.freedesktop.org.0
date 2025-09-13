Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176BACBAF5B
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2FB10EC8C;
	Sat, 13 Dec 2025 12:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="dt1bBk3y";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE32310E1B2
 for <nouveau@lists.freedesktop.org>; Sat, 13 Sep 2025 20:37:46 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-264277e8b8aso304395ad.3
 for <nouveau@lists.freedesktop.org>; Sat, 13 Sep 2025 13:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757795866; x=1758400666; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mATTaO6ztWHtL31tz3fa3XmKHBNOJGaadXz3sI1bEqM=;
 b=dt1bBk3yxeEBrMzM4l0Wa0qaKBeaAQFf0710pDxaM+kw7t5TV/bNhKawqfTt9I/oUl
 3/Z9+epJqujrXj5MlMWJ0j6slxMdbqGp0CxvPbWwnYusmRCHlfHGCOZ9g58N2mKsQDmJ
 i6uS2aW9e3oqyr6eQXiZH+p1mdv4uDIjC2ZzHm2nMsNBteIqBmweeQ5V80ejF2LlSXs1
 9UogW710RhMpZPqero/Pkfwbc+8m0mWTGh18iN47bkeIh/hxMsg0mcMhhrXHjBQYkpGP
 qgtLMTk9uBSXqqycu+d37IPccVkFxjJD5/NDrrE29qy7TQ0e9ehAfTWf09OAX1+Xhnm7
 JNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757795866; x=1758400666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mATTaO6ztWHtL31tz3fa3XmKHBNOJGaadXz3sI1bEqM=;
 b=IvqixgVlZRGLwl9Cs1ji7LJBJlUUXZA4vpJLh0fmirqmWDNNWfiTR/SBktqaN+AvfB
 YKINxARMk2HObJz2M2llSv0KQ9I8/8RasO21XWfEcTX6bQ/xHDybEHTmXiZ7J1qZPkVh
 cD6askaYWIdCAmhzg0GYzU5a1LfDpimeRh7tpVxTfEgfNFs8z/LemIzusFujETeD4VN7
 8XAiiY5J+DHbLFeaR01IgbPnYq3jmo+u6uq8Q26NFmMx+DkrBVZjDQAs1s1I86JwMiCz
 k55PTrW2/Oes9Lkem2gzayvvyNGfTLLKh3a6WT/bedhkixwYSRhCHGfLSN4POZsjdVyO
 gNTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2fkf6xyR+6qHidtuaWbn1adcjAsr9a51mItrGfoiVJSwHM+lq0klnxu2gflRQxsVPWF0FqJOW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcQXJedby+s+78CPH/zbAnPQpiBLM9Q39jTWlOMSVwLvb8Ij/F
 L14anC0JeSf3ytseMlwV9jRAC40P0Lu1gigabyjNAYXlzaCtO/aC1tTqKw5K+qKZrTs4tF4o+0x
 3JCodeFDEuoEA7DhcORMPIPLDyRRFK7w=
X-Gm-Gg: ASbGncsAJBYRLKJcl6695TCL/iNbLJ9VwF0693sIWNI+Xp0qaEx7tsuDcrlYrlqXdGz
 ktUwfvYKhqKW3u9hviq0PnEEkPdUuZNCZr2UF0mlUwpiGAIiiSnJzqCJXb4+prtsCJCqPQlbFPY
 mtV5qkoXA4wR3D3eAE8oB4fUiz5GFTfovFcInBgX/8oPfrjdE81vcKSoMWA/ydl1JXgpZbaUsID
 P7guPw8C0EkAHq0mrOJwWkRJZ0ZdvtZjV2730Se1hQzLV3UJV7Y8coAOx/cHM5Ni1zytzntF2d8
 YVWQwNRctMMbSSqbkWB0Cs7VoLloSDwf4pz9
X-Google-Smtp-Source: AGHT+IHrVkKejELNksEXUkmKRimQGTe3Ad5+7htwK4BUNxGJGqqmJCijjdcznEeh8fuxUViY+RIMf0xL/mdPT29M8js=
X-Received: by 2002:a17:902:ce87:b0:261:500a:5742 with SMTP id
 d9443c01a7336-261500a594fmr14779775ad.10.1757795866176; Sat, 13 Sep 2025
 13:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
 <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
 <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
 <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
 <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com> <20250913010226.GA1478480@joelbox2>
 <DCRPJKD0UHDQ.IOWSOB2IK06E@kernel.org> <20250913171357.GA1551194@joelbox2>
In-Reply-To: <20250913171357.GA1551194@joelbox2>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Sep 2025 22:37:34 +0200
X-Gm-Features: AS18NWCCjEi2nGimzvlQTTclneuWdDWNwA3S6j0YpJVAggEoL-8q-kmCadYD0Hg
Message-ID: <CANiq72n50MaMXeWdwvVOEQd3YEHbDRqeeRzbdY8hPnePtq-hnw@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Sat, Sep 13, 2025 at 7:14=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> I am not alone in that opinion.

Hmm... I am not sure how to read this.

> This should be first-class in a (systems) language, built into
> the language itself?

I would suggest taking a look at our website and the links there (like
issue #2) -- what we are doing upstream Rust is documented.

(Danilo gave you a direct link, but I mention it this way because
there are a lot of things going on, and it is worth a look and perhaps
you may find something interesting you could help with).

> except to satisfy paranoia

Using unsafe code everywhere (or introducing unsoundness or UB for
convenience) would defeat much of the Rust for Linux exercise.

Cheers,
Miguel
