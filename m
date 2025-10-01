Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 928D4BAFDA6
	for <lists+nouveau@lfdr.de>; Wed, 01 Oct 2025 11:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EF910E307;
	Wed,  1 Oct 2025 09:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="peLpBaP3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BDC10E307
 for <nouveau@lists.freedesktop.org>; Wed,  1 Oct 2025 09:29:22 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso3902721f8f.0
 for <nouveau@lists.freedesktop.org>; Wed, 01 Oct 2025 02:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759310961; x=1759915761;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eWhaWIh1Ch5W+HrhvE/7nWxIJ4BqD2s5kUI/3gBmyEA=;
 b=peLpBaP3mucvkMjB9bsXLkHYoFmnmFf3Hb0Ueyl20tPydwVrsZYhw5crmAIkky4MEa
 DWVcqQrS9IlGt2UkPncpITbnNAeLctVQcpEuAX6qKvpI6uTMN8EkOHINQSZs8XKgDRF6
 ZhrVVun9PfPFrPAA43GLatI8KAmO+BY34FF8y5t+XNijrzSMosXIAGtcqIB2AtK/XLx+
 ueLe2ZyLDFt0tDH+PGHhBVZwl/m7vd4RskKgMSWkvaFC8pt7Dy/vExsCh2D0n9icCyQN
 KZklf5L/0+7fa1PUJzDBnGUToCJOxZzuig+FnwpZwdhpmTOL2z9Ykr2wjRUJH05uTc7P
 UFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759310961; x=1759915761;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eWhaWIh1Ch5W+HrhvE/7nWxIJ4BqD2s5kUI/3gBmyEA=;
 b=jM/W/IDg42R5hTQG3JRsw6A/rsm9E6q1kby2aSouQ6omIl+xrSktrwfHINACoLYmVN
 gf3ahBFzIF1M60pYFE/2Oybje6I7uO504vtdoej9DhRs4BgZ6qM6FqaedfMdp/EA48lB
 IgsjQ+1nGizISzPjpCCwoKjG7KirFo3o7ncM/t/i+iSBLrWsOpxzRF7zksdGZNDZpvUf
 jUkgx6j5I5Mgm83qMH2XJPl3csAda29M4fdC0t2sxBwJ4UQQLyz0q8Qez9OXA9SBSadP
 Y1WTcCz+QkSV8oW5IPi4F8XxJMI+YmyL3yLY3Ww9Zic1Q3YTyWRFY1NiX+i+wJ+b2kYg
 Fcow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPuOg1XK8llkHFoU6pM6BNE5AYrgCJg3UzLFi0RKjwKiyB45YSLT93C/KSscTVexamh/co3FpQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIGfCMfBTnUGdqFmYb74KCI/eefHY/E1e2KjCQmwvn93vc+yqV
 gNWw23zpDjWKc7XOf7Jf7a4fJqt9FiB/JSiWHjbbb7YFG/t+jLj8+aOe0iFMgjyYcu/fHPuQHsx
 2+QIET2uQUT4L3gi3lzjBvw0UlBKuTapzLel2xvGY
X-Gm-Gg: ASbGncuVVV2j5bWzfXDywC+XmcRqy7VuSg+IzdyKQoyeMPxm4p18x9xS1pZQi4UjelP
 Pje4RfJckCyCapF/EgTeNzhPL9M4o27FEwfYX7VaG1AY//nVuzDmAHksMMZaNY9xgJZDkhlBtsl
 oF5qFxdNJ/92tizoDNb32eSW/mKbp45JMKQRo0DJU/fV+ZpvRMEzrJLUPSinOOe9zve8y7RiHjt
 Hp2fcde0Oi5c/GjTJO7ZlJk25qOc6tkaO/tDSnZg8le+3LMn1lHQMP+RWxPVJXHH0Ty
X-Google-Smtp-Source: AGHT+IEGTvzQBJ51h7EDzxRa/Kisf+BfY+7cpvTrlEhl/iMUN4+q2HPEwsb4ysW4cM34kR4mPUadGwVDBMTe2U90ivY=
X-Received: by 2002:a05:6000:610:b0:408:9c48:e27b with SMTP id
 ffacd0b85a97d-42557820c81mr2042096f8f.62.1759310960773; Wed, 01 Oct 2025
 02:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
 <20250925-core-cstr-cstrings-v2-19-78e0aaace1cd@gmail.com>
In-Reply-To: <20250925-core-cstr-cstrings-v2-19-78e0aaace1cd@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 1 Oct 2025 11:29:08 +0200
X-Gm-Features: AS18NWCOfBcX2Vbfhr-fnk5GPcApSeOL4C5SAm45sMYmzlcHM8gTiQQ5VZSiyfk
Message-ID: <CAH5fLggd09hodiDAdNRy6aXK9ANCP==YSJwy-GMbhNAAMm731A@mail.gmail.com>
Subject: Re: [PATCH v2 19/19] rust: regulator: replace `kernel::c_str!` with
 C-Strings
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Breno Leitao <leitao@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
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

On Thu, Sep 25, 2025 at 3:56=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
