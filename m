Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9A0CBAA7E
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD3610EA58;
	Sat, 13 Dec 2025 12:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uat1NaoW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E4410E1E6
 for <nouveau@lists.freedesktop.org>; Mon, 22 Sep 2025 21:59:49 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-267fa729a63so9357845ad.3
 for <nouveau@lists.freedesktop.org>; Mon, 22 Sep 2025 14:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758578388; x=1759183188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kTVCircg+kesKPnjuiU2zmcPm3Wk8hx0LgVUotPUxPg=;
 b=Uat1NaoWlUDqP21/wa+Kqj0+//tnYRAHH0CmKGlA+HrhdbRHzQQp7+XgyGTDy1XCEi
 L88k0lIbTgJkr9pSMJ5riW0xvV+OITxUi9gZ+Sh/ZVO6pGPLJSDCAyCojcPBZTH7rjJi
 RGkR/vaG1RxVW55USKAzL3UQP+vYtDXPeZSndFWPQB/D2e+p2FiJoeNO5MpVdBdANlVo
 MIOobk64VHKWE0yKgkU+S6ve/fvSD9neNU+ZASUSJTIofuBjOm8Fo01BNXxVxNUPLt9q
 hon+Dk6YEnXy5uw57juiYgvNHdmsMBzLohi9ixDleo77ul8yVIPLaAsdkGUwPmFN7CpB
 KZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758578388; x=1759183188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kTVCircg+kesKPnjuiU2zmcPm3Wk8hx0LgVUotPUxPg=;
 b=H35slczpsHuzDmiXlzpEUz+StM6KCHMk7ue/jUZ/chEdEiC3dF/sP08uYZ0Gb+QKSU
 H5fKAZEnF/6L+8SK3oBRk3MluzljnRlBQEZUGUPgDp4q1EOKxgVQLZxhb63Jvc7+CF/d
 YOZhfP/tist2/6/K1URk82nWv9hAKvLt28l7xs0fE46qpv2bJQmv4aljYJG32Zga9INp
 KuK9BFwMXKNhjGYP+ogs23k961sELtu8DakRW/GtJuRlMRBqORREcFxPtaZwroVKc08k
 7NPj8xIeBktFzTZc11tHU0D6j3yMiEmeuTNI4hXAFoO/nE2tbEz8Q1+S2tFbZiLbqWLG
 7GgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQTQc31+EnMvF6R6BMORXoO1uPjRY+7/X/bZFl1iVUSbMOQhUdXlwmIEUkfPQotlIRux7IUVY8@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybPz+HimiCHZdKHiWY3XCN8yegoaIfbZw4fopTgXC/WemwXK4N
 JPLI74nJ9TtGtw/rtqJiNg/0uh4hN8deCYZnfGzf0w5sZPJ0dFC7g73xSiTSRRFShHP5GoUvn0x
 vTG16FflyOZBpSpsRoTCbANU8e+Shaiw=
X-Gm-Gg: ASbGncuwIxP9L1es0sblyQVO396fbC9AmRQopkoQT14/ijw/c8do58+Z+hpFZ57eHG8
 paAPEFHz24J1XYYX0R0kcgQ52OCsmLQV2tts8myByhM9un9ALFCb2DZRVZI4vSLdXj6T6MLqzPT
 EteoslO6kkfkhjFXgLTWQAitbM7CW9Fbtww+CeBWelVBCe9Gguod+h74dVJU1VpM56xd2QIp3kU
 1LT3svRHkQYHWi3aGVS/C5GYNIvToUFxo7d0Hg2WJaW2iFPzqdVdKh1MktHMQ65zOVpCl9AnHZ5
 j7utXryLufoIJ+t+Iq8YHizzdA==
X-Google-Smtp-Source: AGHT+IHO8cJKGFmF6HkfxzDA37dCzzF2eb1sWGALw/BM92tVXUO+gzQ5qLlWsYCyw1t7RNfA8rfVA2phVEot6qjLLv8=
X-Received: by 2002:a17:902:ec8d:b0:269:67e9:4c20 with SMTP id
 d9443c01a7336-27cc41d582fmr2476225ad.5.1758578388477; Mon, 22 Sep 2025
 14:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
In-Reply-To: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 22 Sep 2025 23:59:36 +0200
X-Gm-Features: AS18NWD8TsrWVNTwE-9v0GFvv0Ifjza16a049-IVfVsrSbDAQ6mxb5XW5HdMIaY
Message-ID: <CANiq72nP_VwSnFzyM4HKk5GTAwJw+MeX5JXqA-yLBa9JLe9YOQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] rust: add `Alignment` type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
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

On Mon, Sep 8, 2025 at 3:26=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> The first patch makes two additions:
>
> - Bring an equivalent of the nightly upstream `Alignment` type [1] with
>   an near-identical public interface,
> - Add a new `Alignable` extension trait that provides a way to align
>   values up or down according to an `Alignment`, and implement it on
>   unsigned integer types.
>
> The second patch makes use of these in the Nova driver.
>
> [1] https://doc.rust-lang.org/std/ptr/struct.Alignment.html
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to `rust-next` -- thanks everyone!

    [ Used `build_assert!`, added intra-doc link, `allow`ed
      `clippy::incompatible_msrv`, added `feature(const_option)`, capitaliz=
ed
      safety comment. - Miguel ]

Cheers,
Miguel
