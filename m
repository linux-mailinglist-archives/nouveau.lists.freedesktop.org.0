Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7144BCBAD9D
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B9010E111;
	Sat, 13 Dec 2025 12:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHGR4XKy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF3E10E6E4
 for <nouveau@lists.freedesktop.org>; Tue,  7 Oct 2025 16:12:20 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7811d363caaso713482b3a.3
 for <nouveau@lists.freedesktop.org>; Tue, 07 Oct 2025 09:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759853540; x=1760458340; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5E7iWUmZ2vIjSTqtzT1C1NtPApyBCh7aJPO7S699wwM=;
 b=CHGR4XKyAuhKXhgngWTLtRQhUQaMf3rm/8JD+SZ95duuwGhcosnlouIgAq194mV0Y0
 q2swAiVcVD7Rq5vzHaJOpIGaenHKiSkng+BP60rw9FJZ47ikzBTot1pc1HRJG51TIrnm
 JurFTPpZ/run7+bNOREIY6R2aW4mnkzubNVH2khduwrmgyP6pWjkFf3mhIfyF50ETmc5
 u0YuSxICtHYAu4s1gAuaLJNbhC8nI5/T8eZSm65qPo40UqZz4ooW71rbDOGH2RhoTGrK
 9QflvJUrM1jGQnPthgAl/UHK0nUURh5drSmwU9R5Z7C22x8RKz13EMNPVTG0PLxZjtId
 gRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759853540; x=1760458340;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5E7iWUmZ2vIjSTqtzT1C1NtPApyBCh7aJPO7S699wwM=;
 b=WHyHwplE3Q+vsNcldQTYrG47Tec3OV7N0lNSpVdHUBYAj3vTosAqmWgqIou+820hm3
 32TuVistyihvGsPJ6jFA7zmCJ6TZsakDSbKagR5T6YMEQFyTiT5O++m3pwTDalniAS69
 a63sbLR1GJDdenFB7TI3V/u/KkuKlgDn/yujvZYxI4gxEhxe0OvyIiigVdnYYnod84zQ
 sCZMf9AbFD2uvUbM/R//or+Hhp+r6Xu+ML10WUTOyhT+Cmw7kKAvNykJUDkNSmLE27zC
 HHPCKo4x0+VF4/YTa6dw3EsIwU5cQR4zm8t8mfALSmww7cyE7YK/IUnMpEGGy/WlEl8E
 ZlpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHHLvp+N4UI/VRZpdwwXu2HklSEcoj2dh+tE0SZ5okEHNR1qWUVfcW4l6VJNoZorCIN9xQwDR7@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3Y+hhtWh0yVz6WompwXAgATMCqRNoCf9UJq9+IkGhsWihOxO+
 X01iOK7ZFa3JPG2WfyTCA18JTXz3BYHIRXUH/NSsQ/jBbOyY4TrgWF+nsg9F0nOMJgWLNPCg/SV
 +01PMjH+V0Q4QmksxV0eNlutyWv5GsQk=
X-Gm-Gg: ASbGncuZ03XOnqkWYCez2bloNeaATJiO9uho3wvYa71/xzr/36cyy3vIvS+zc3AThZN
 RKbWIYpFvHIRjaKq96/FHIO2tVWBtIm1H12nqI8KP8yIYHqEsQ/N7zcEY0LZEk/cfgjYQYGrA0G
 B8amCEks2AQYKscvnJHggmuTUeaEfpOSsXQ6W10H1GiGceEzqdi8a1A2EkIDS9AFEm43xGvhx1f
 P5LmhJowpyTGz3ZUNlTWOQFHhI9kxEetAvY6PIljOqKHAd4tH/p79awMmC43pceDQyXYiKcolq5
 NkPRBA3mmkIvH0sLHW0wGCZ2hJjKlGU0oYJ9q0W5zIrHaEI3Ug==
X-Google-Smtp-Source: AGHT+IFCzHpcrXLGR1ie60smXpk8UuckeKOb000I2PbnwCKR7UoPdsv6hdVQqjL0vFW9FH9QZdEfImMvB9toz+HjmvQ=
X-Received: by 2002:a17:903:1a68:b0:274:944f:9d84 with SMTP id
 d9443c01a7336-2902733fb0dmr2059795ad.11.1759853540296; Tue, 07 Oct 2025
 09:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury> <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
 <CANiq72m1eiGVJHNyym+JwM=tQ9bGnmoW0+OuKQ3Vxo_AQOy5dg@mail.gmail.com>
 <DDC4DA0BPHRC.3P5M2CXSJYYTI@nvidia.com>
In-Reply-To: <DDC4DA0BPHRC.3P5M2CXSJYYTI@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Oct 2025 18:12:07 +0200
X-Gm-Features: AS18NWAPdykPHVe-VPSk9QmwsEQUF86AhW888gSoYNbxgNmy_9MCu-o1i7ygLqA
Message-ID: <CANiq72kykzwdv2fOmRMeJ_FPztkkU2a=PFDH1fo9+XbGAeKsaQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, Andrea Righi <arighi@nvidia.com>,
 nouveau@lists.freedesktop.org
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

On Tue, Oct 7, 2025 at 3:21=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Ack - how do you expect things to work in terms of code flow? Do we need
> to have a dedicated tree and send you pull requests? If so, should we
> host it under the Rust-for-Linux Github org?

In general, if there is a better tree (i.e. an existing C subsystem),
then what we always do is ask those maintainers first.

But, otherwise, if there is no good choice because it is something too
generic/core, then yes, what you propose would be ideal (and it should
be easy since you are already maintainers of other trees etc.).

If the amount of patches ends up being very low, we can skip the tree
and I can take the patches, but PRs are simpler and scale better for
me.

Thanks!

Cheers,
Miguel
