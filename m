Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB5BCBAD0D
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CF910EBDD;
	Sat, 13 Dec 2025 12:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8YBKcob";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9B110E253
 for <nouveau@lists.freedesktop.org>; Mon, 29 Sep 2025 19:57:42 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-27eca7297a7so7733705ad.1
 for <nouveau@lists.freedesktop.org>; Mon, 29 Sep 2025 12:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759175862; x=1759780662; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ILAe+VRfX0Fc+b5qLvaJzfBUJ4qz7jOpbJP92apYs7g=;
 b=A8YBKcobEtAIa5QOJq/qdapdzMpIZ8KLC5ncWD+GBNHFUyWwccYdsd6VmdFelqJnYb
 EoalWCr4vhAVTyeeAdj34gbv5SlOfjBxhCWcr5Z0QyhwqJvi8j6cUiiNVxXN+U4D8Ajw
 XqJ72YtDaWoTSiojaVmz3d2Jq7lWKY6Nw5C2/V+wuG0sawMcMl87zJTysTuqo9eRAScE
 yMq+Gnmw6CeEaMTjT8Vd8NTYoJtfg5an9LRdboVWnOPEbXIiWTolIsRpPilf06QWSBNw
 uvQ0vBKD3QMHKe9IdUwTg7hXxIXtrrQTO6lRpzfPp2unpxmIhWTnpfXfYSrhn6sD/Yh9
 46Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759175862; x=1759780662;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILAe+VRfX0Fc+b5qLvaJzfBUJ4qz7jOpbJP92apYs7g=;
 b=X777jBsYR428TVdH7/MXjgZSDZp8n6/rFTCsfX2322HmvPb/q/I5eqKYE93jXBFZLD
 TYjca3+y9qRw4KHfFGVs41wZPGM06qbbF0NdY/TFrX35ER7OBeLIqzo0c3sfBf909XBN
 JXwK80mxIdlCP44My8aywaRhfbsCG7lt3xcTKAXWLN0fJ4EnOJua8sc21RyMRs1dvkcG
 3OkIvYgi+MCtZP2TJ+lJOsALGwrxO3L3zJAj7n2QBiODzgZmYMY9pG04YxB/RwCueRUW
 T6pw6HdYOAVRyM+Uka2ncJB0xgqSddP7l3BE4FUTfRXLicMxcFuIYWvgdHRngbBi+bJQ
 YiJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5kT6HOBsbHOfcSEvFLbY90FQXd6oypOl+dqGrNrzjtFaUcsEp8hZvlwh4AhmCb7ndoNw+jg5f@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXwMahVONCpiF67fi/dqR0DGCLxdOwteHAPITxZgGjeqBAUaqH
 k9t5N9cM790I59owZKwN/kRZ2pniucognic1MHWcpe4mRg9R3HrJlPL09/EFhoq34f7INS9r8jd
 0yeAW42zsQWGhCHpgUOlWHObVk8aZz0E=
X-Gm-Gg: ASbGncvZwnnhrtVMUALQ9A4MXcFRJloHxOopv4uFeZNOx1kJ2qWFgP/MiyvdulfAha3
 HMmxxWxp82khbt/dIUUTstoUg7Z2fOYpj1HXBBn0hH+uvKR55MMfnbG8Vmo7u+ireHm7oqOEPJJ
 q0B0dFkLEpLSAePLTPGDaLSBUrmFh4PN1klyk4n+S3tr1kWGdu7fuD6VKf4SyGkkqGwdt41q5x2
 uh7ZdvL7wF/O0dF5BL9GVAAAuKMt6Cwp6AfW4879SHl8QKSjkT8vAmlCCJ0VRZbDrim/g+NQjG7
 Pi51RwH7jPl8S7AtLMn+S1RP2GwUR0mKVyPs
X-Google-Smtp-Source: AGHT+IGYfATe7mmNTC4A+jEkwD5MzSelb1z0lWF68kS0t/NWgoEWKg6nD9jI4X3FoSNWbDyeH2i7qWWFajxt0X+1x5w=
X-Received: by 2002:a17:902:d501:b0:277:c230:bfc7 with SMTP id
 d9443c01a7336-27ed4a5d82bmr113039375ad.11.1759175862141; Mon, 29 Sep 2025
 12:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
In-Reply-To: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Sep 2025 21:57:28 +0200
X-Gm-Features: AS18NWCM9kbfT7mylXQdGB8ZyL_b6RmUa1M3XR6zo5RoraO0TPm_DutHWVTmZ7c
Message-ID: <CANiq72m=TJMWFZhHSSU_-A3+tr5h8vA+X+oKb9TcieXQ6gHyJg@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] rust: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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

On Thu, Sep 25, 2025 at 3:54=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Changes in v2:

For future reference, this is v3.

Cheers,
Miguel
