Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9DACBAA5A
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5574710EA4C;
	Sat, 13 Dec 2025 12:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2iRuh2s";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A510710E503
 for <nouveau@lists.freedesktop.org>; Tue, 30 Sep 2025 07:15:42 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b522e2866bcso711438a12.0
 for <nouveau@lists.freedesktop.org>; Tue, 30 Sep 2025 00:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759216542; x=1759821342; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bYKtjmuSp8WHPKGo1stRMHk4Zp8bG7Oz5IVoChYgOsc=;
 b=L2iRuh2szn5zMF7qWJeJQTZL/TuiDvkrdK6Yhn0IRxVIOWAAUVW9Z3wtSG6dxpa7BJ
 KKnTkTFIdtpuVnsOD/CtmiX5bp+P19VgkGO36fO966ihzm9c1buMqfH6POMeH45yiH7P
 TTuaAWMdm9+nuVewUC0B5gqZvcfEMoHtnMc0rQmX1Q8gVs1TtZO4I5qIC/gmivMpINlj
 faR+mPg2F2ekctZc+hH3CkgXF+HeJwlcJrteIMQDnYFjQU2kyjDhUBqEy8xqf+7jIR/q
 lppfoS0AVm+74wmkLHTzT2K3whnk45T1CMw6Da3TmsygWg8+tAkPrlHRJHSc2gumWGo3
 9eng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759216542; x=1759821342;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bYKtjmuSp8WHPKGo1stRMHk4Zp8bG7Oz5IVoChYgOsc=;
 b=gvWdlE3qFLwaaptaZ7VJaUi60h6sl63S8MVBDO1pdG6RwwLjewGyI8mieD2i/H98td
 FksXVCgtz0Gj2/Vqhe2R+qDorzBzqdMudHoxviaYhMJIeD80JMgC1lAKPEkK1kYtArID
 9dvUoxDLXoOR+2bvzxV7uxwJH7AhJIcJMoUG57vnbTsgA9xe4ZoKei6JDxUwhoSg3opK
 dXv20t9y3tD1pamLkAm4N7DTcBZME3z4Y6a8z4TDYFASMMSO9bK6LvJdyfN5hB94hKRF
 QPl4hH1dH56FnCutb2K/XijogR8CkTBH9/eNNWry1JwDrEqkS5B9E4WrMEt39amDe+xT
 990Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhLKBROpG6k8o0kn7Ypt3NC2ZKvU2xXootgOPm8NylnmvJkhbL/3KQScCFVAvG/eQs/I+HIird@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu8mRZ8r8aIFJuKg0GRSFDzUKAaO8yCqq3Tx6gWisuJWku8xnd
 UVazPZCda9qCHs7g/w5i+hsA0DYsewezknOrTY0n1TE/gOpWi6MEEo3UWZAtibc0hl0osAa57Mg
 zb7jT4N94WH3dB6EHXEYS7sXoWCfBKrc=
X-Gm-Gg: ASbGncvcPjty7ierPzL5Dk8rrOLrVarBSNzZ2DCvpj8RcSsFxVLywRuELoj1E6wu26U
 hr5fbC4Z3ucRKaLx0/HDSTCVPdULChPX0vy44XSCk3MtFjxtwCfPhDzkysNNwXD49Y5gXJCQNCk
 R4Ep4horratXsvUajhdjr8dPdr0iOHUbcYUOx/zwD5nHCIJb1HegAQk4AlOo3ffohssiWMYoqRF
 KYNXherZo5psSAIw4Kak23oMwyJEftlsBo+R/cxWI/ZL/G6cZVcsu4/GpUA6BzXWX04+r06f511
 zrsg8q9Adj96qpEFrILhvLc63RgkAQhQqrgBBTv2QU7KNdqQq2A5jfbP0GVx
X-Google-Smtp-Source: AGHT+IFP7t5MzVLMeqCeEzPgWwzMMlQ35L2NiKbBPcqBGD7XWZx+ZpB9ob6tpl2FHQgys9W1N33lBcgRC3EHBmH+gvM=
X-Received: by 2002:a17:902:ec85:b0:272:f27d:33bd with SMTP id
 d9443c01a7336-27ed44d5f06mr135508985ad.0.1759216542032; Tue, 30 Sep 2025
 00:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250930-nova-tryfrom-v1-1-0cc1bb507047@nvidia.com>
In-Reply-To: <20250930-nova-tryfrom-v1-1-0cc1bb507047@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Sep 2025 09:15:28 +0200
X-Gm-Features: AS18NWBXJDrDh3CHU3MG4Bnt1-ohuc72B_SoqOSakBKgfBdQNMLxKs7VmYo9yF8
Message-ID: <CANiq72n_pG8u7N7=jS4LfNjz+cP8xi1nVOxaGH=XXfr1+nea7w@mail.gmail.com>
Subject: Re: [PATCH RFC] gpu: nova-core: use the TryFrom/Into derive macros
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Sep 30, 2025 at 6:55=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> As requested on [1], this is how these macros are used in Nova-core.

Thanks!

Cheers,
Miguel
