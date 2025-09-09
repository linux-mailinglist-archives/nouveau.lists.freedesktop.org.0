Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4276CBAA51
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C91C10EA51;
	Sat, 13 Dec 2025 12:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+CxX6ik";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3699F10E80D
 for <nouveau@lists.freedesktop.org>; Tue,  9 Sep 2025 22:04:22 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-55f7c8b38a0so971110e87.2
 for <nouveau@lists.freedesktop.org>; Tue, 09 Sep 2025 15:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757455460; x=1758060260; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vJE7SAtMU597GHTC8LkC90WpJdQrYFWukdI48tYxJKQ=;
 b=X+CxX6ikLwX22Bk09wfnpKici+HVFrwJ9ryEIMF4tTsGj7ZhDpPcniYu7OJj4MeQ0f
 pp/dlj2oVKpFQ5XiDD8dcisTpgkTfbxtugTOP94Di26ZFWkpHSsdEwcrMQCPEPXyFXw3
 k3HL2kG/jk3Glc4ZHq8I0tgWsWSCUyKsEP7WxS/2dl7hl7zwBft7e6O8hiNFfHHOvcx2
 ermZKRb/EbfEonSp3nyG/O9uu+RXHSSkug9WckWTrsSe1+bEmu1cmSB2y7tecV6voFNB
 NelqyBsDIP94E2ApDo9jWYlMbkKW/T5ADDSIdUKjSQFeLNb/GWB4sF8628ifcbYppMf/
 Js5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757455460; x=1758060260;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vJE7SAtMU597GHTC8LkC90WpJdQrYFWukdI48tYxJKQ=;
 b=tbozbU6xpIpXbnIpx4iAx7psV/1tHuQ/TvDS8tWhhxnQ3UmSBd4zsEv9kJ34J+aq52
 TJ6CfFT/iegAMf0DmqMpH7YYe9VNLBLrtZ3GbBo1pWANGZGkCSOm7YfSK/DbhLbrFQGM
 KNfUPO7tRjmAuGCIIyhsGNuSQctEInI/+wIKnoSmDlsJdO2IqRUIyoQtFbjWNw5REZ4T
 Ln5wmFtThVVkP1uxBfw1dyXLA1uJa+MfSVtwKDiP9W4qPVGDzMLCtdPQPI0nMrrHXgXM
 XVp3uHYqf7PVY4ESy7PewKVsu9D6UmuHv/ranLJvdnZFxSgYkpGC1ineRiZDL3uoHjzc
 7ZSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4UUkfGy4YztdAYORLf7TodWUVqYJcJrtFBjypDc8Ae1fiO3bUQYd273W2XkXLZZIR54NIWxkF@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yze6Rr6bOyFfkByaUUH5ZUgqWy/R4s5J5w4fZPo0VTovQmqLLj+
 BB36FomkzCKzCZVK7fdUOptlBLUFWeT7AZr6xvf/8S7KXdx01u4bPNEgzVEjJvc5RL3bPG9rzsU
 pUXEKuuKzNsVgptDkTqVqeSzciAYwCWs=
X-Gm-Gg: ASbGnctxMIvWvz3iQkL0UrsUC4XZi2+KHXtZ/C+J92JVWr6SW52IIya26O2jdUuBVzc
 PpRWcOGTGiD+tsNL0HRHhZYh5W3XGkEa6GqvfVt29cJi+r2hfcrelKi3YWG4EC4NDmbGPy630NM
 X7ZcA442J1QpEGvZ7snrvSEqRZukce6iZtgJrP3zwF2m2vmggUtcUCLBzhEtKgPqRtGL/+PFY1H
 ZTkuyWZPVNvcgquztolQ1T3iNd9k2X84rT63HhcbnjfiUf9BXQr6LmQwyFEG6qJp3pBn+N8iF5P
 NCRSi1adQFF2rR1osln+3qkGICR0XIm6s0nL
X-Google-Smtp-Source: AGHT+IGaa3tKhTEeaj82Fyo2xoHmCsDsP1VnOtUkctEIYGUN0qmz9E5woHXIzyMUU0VsfLfEZBQ0b8TrzmrdoI/zncM=
X-Received: by 2002:a05:6512:3ca4:b0:55f:4a0d:3f50 with SMTP id
 2adb3069b0e04-56262a40f6amr2161481e87.7.1757455460118; Tue, 09 Sep 2025
 15:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
In-Reply-To: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Sep 2025 00:04:04 +0200
X-Gm-Features: AS18NWBzPuHqngmTpgXNZpIRD-OdqL2Y5OEaYpGUN_Vn-7watZfMYtmQRtqbWzI
Message-ID: <CANiq72mYzgx0dB+yO4BFBRCNEKBcONx56Jp=h7HKVXzkbRn_Sg@mail.gmail.com>
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
> prerequisite-message-id: <20250808-falcondma_256b-v1-1-15f911d89ffd@nvidi=
a.com>
> prerequisite-patch-id: 2439f5f9b560ee4867716f0018b5326dcd72cda3

I guess you had this in your branch but is not actually needed, right?

Cheers,
Miguel
