Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A711CBAE7F
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCDC10EC25;
	Sat, 13 Dec 2025 12:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSpfTvAt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E1F10E029
 for <nouveau@lists.freedesktop.org>; Tue,  9 Sep 2025 21:36:39 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-3296a9d17d3so516573a91.1
 for <nouveau@lists.freedesktop.org>; Tue, 09 Sep 2025 14:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757453799; x=1758058599; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tri659oiLVCd6VfYpPQXtF9OQ4WThWRJ/JELvDiFurY=;
 b=BSpfTvAthRhREeBDmJ18rqbotUxFcPncoNMhMkzUTDWhi0M7hHIcs/BMWNS2zucOJY
 nHDvYEyGh+ntfRAfALs11gkajyQsLfPj148z20NsMzRUzxRKAYtSg15V0JqTKllObLIw
 n26SpIwVDrQz+hxSo6JzI/8hjWmI2QwcV7AoTf3Q9NrkAiQS5LOqfDLFLSSng2CP/3y9
 8fYCqvqT6pHdZV5BijRFCD1GCPr83X8W925H8jcOH+0RxG9RI37LzQqhv+cbTPJZ1vjP
 Ax4kzO3dXcbs2RJDW5f1uC0fOv3ucviz9xSsG+/7mg+7+YzRbnHCVhFVKTRB6rQJJOxH
 5lNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757453799; x=1758058599;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tri659oiLVCd6VfYpPQXtF9OQ4WThWRJ/JELvDiFurY=;
 b=xIY3fJU64QM3dicgzNcBn610LMA2UPRMsnywsGGeiI9SM5KDrTLBo6Ut1RZOV4tDt0
 VETtk8fQYZnAOaeimQz4hLJxnaLZjDmpmdyFU7VkmvXeTKk4l1RRIArE63kitJ9gYmgw
 UFaqGZL/vOcqE4v59KPo2g21TAjKYXxKsvdZ858N7ADLlA+QzGxPSwg7qoR8M8qzTJ7d
 H8gSc/3v4UjnUkiv6Grdp4L/ZmAsLH5gkvaelxhfz4pwCYe4OewYLFg02BF8K7lcoLjk
 /J8bOXEr89xeJYVZ4GONf5sOR2+T5Wj/CQ7Svmeg0ew/fESKxxyvoH0BsEqw4MSu2GMz
 z9Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjV2afhCGrmgSzNaDb8+i1eMsnxoBLi+ZVZmCxwKyEjusJ9nrN01DJkl4QZVV3Ltu9VMMFjON+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtMLQiN7RH2fzeZcV3xzNZfTk6f3FvQCyem8C+1XDBN3ozNlDR
 5FtqU8UxIn/aon1DGTPxTzRXX719JKIw3yjJUvvpYc6a/TvOt0LSvlo1s5yQ/UQ0Pj/yAJKHCJB
 97VjbJZhN33lz/VkxF1N0V8GkjxkxPAs=
X-Gm-Gg: ASbGncsisuu5vxYIy9fzpY4LkK8Ubzchf/naGgHAItzYmMw50RNoV45M3VBlP+mRa1Z
 UAYnZcdcwfoUPBmCJHkzX6rqj73g6DHwiMpVI+n9CSW+nFbkTdxEPatsLbMBj6eGPIqDqsitHf/
 7SzO9dZNErPD9MQgEZ4zCeGeW2mj18FafQ4MdJHZ3PmshvH4hW3XdlYaJsLupj+E9uNICQbOm0l
 ERJz+wnCNO/gQsrsRMmbJVGeQ6oAkUiLHm8HEuv1rLh6dylDfj+NlYWVBdR2XReGhs2mNQvYSDd
 CtP48OIlszT7I/sfKP+t/NiupyhnbYF375m+Od7lIvsPrN0=
X-Google-Smtp-Source: AGHT+IGfWuRbBLApbA1biIsSRGuFYUHQhWq6XH4sIOFxuFSe8wgAAY/n3W+S5dtyGYo44L8oScz+D23Y+e9Y2jG9A1c=
X-Received: by 2002:a17:90a:c10d:b0:32d:a2c5:902a with SMTP id
 98e67ed59e1d1-32da2c5994bmr2271358a91.5.1757453798983; Tue, 09 Sep 2025
 14:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
 <20250909212039.227221-5-joelagnelf@nvidia.com>
In-Reply-To: <20250909212039.227221-5-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 23:36:25 +0200
X-Gm-Features: AS18NWBWIRvK8uXY04bEb1NxF81YxjlANyREK55xtT2E0vJdhqdmuYSI_9VSyBo
Message-ID: <CANiq72nPQps8ow00AmUe3shArHyhCUSSJX4=6QPHfHQZ_QeqcA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] rust: Move register and bitfield macros out of Nova
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 nouveau@lists.freedesktop.org, 
 rust-for-linux <rust-for-linux@vger.kernel.org>
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

On Tue, Sep 9, 2025 at 11:21=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Out of broad need for these macros in Rust, move them out. Several folks
> have shown interest (Nova, Tyr GPU drivers).

Please Cc the rust-for-Linux mailing list, especially so for patches
that add things to the core infrastructure.

I notice easily because I tag the ones that are in my client :)

> [Added F: record to MAINTAINERS file entry as suggested by Yury.]

Please don't use [ ... ] nor the past tense -- for normal changes,
please use the imperative instead.

(I guess you picked this up from other [ ... ] notation, but that is
normally only done for modifications of a patch by someone else, e.g.
by maintainers.)

Thanks!

Cheers,
Miguel
