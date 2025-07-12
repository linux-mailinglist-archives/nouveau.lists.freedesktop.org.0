Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AFACBADE8
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D9E10EB7F;
	Sat, 13 Dec 2025 12:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJifflvi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CD010E272
 for <nouveau@lists.freedesktop.org>; Sat, 12 Jul 2025 01:30:47 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-73cdff9a27aso648376a34.0
 for <nouveau@lists.freedesktop.org>; Fri, 11 Jul 2025 18:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752283847; x=1752888647; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wzChdIDMvXquT0FReP/JOP0d0Ci6sqsMjGUDFeUN5hc=;
 b=mJifflvi2c9rykjkExI9Bvu6E6JZTbUclnkawZ9sSCD2lIrm2jq2Nr6xhpxz0++v7a
 SxOcDn6Cz7IkMPBl613OVK2s7AOp6nraEifvQHHJU3TwjbBwMRFgVsDR0Z6/geW9e2TA
 RHAME/AGChFYrc7fMU7QyWAH9SIkODUYT7yXFdsLh0TceAigzSWxJRDpUdchIP75A5J3
 Dsxhk+Hq1HLQ2jetcZuo5KU6Ddo/J4276S2pFY/R47di+R0sO0mFUzzTwNDt9eKoChV9
 hmvK/xfB/YMs4RAZZWZ9SBUGhG2x55ndXiHgTxJRbR8pZuld6la/fPzMPKoGsBKHOhWl
 XXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752283847; x=1752888647;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wzChdIDMvXquT0FReP/JOP0d0Ci6sqsMjGUDFeUN5hc=;
 b=AT4hAbgjdljwSB0Dp104ozFPRnirGOyYMZeXODRAZGl5qwmReTeUnZ8ykDzxGWGhfc
 o7gpQg+MYzhhCycuBJONr+nCezbnp9zwHGTmrsKg269J2ywR+uoX6mT7v/PncMnkyHQu
 10VhCWIqfiDRi2n4rCGCSRii4c2PnWkPbYvrG2mE/yCaOfWMU9UzJmS9AGXaWSxl3HtS
 zUb08VLXEHut4FrVUrcV+kUH0HPmRfePCCUmOcLoXvx4xSUhhuTaGeedinpKX0tVJftt
 Vtp6ejvH1BGglSOFqmllL1pwc+f2bOQSgACehtcfS/1B14BsN94hVKerJ2WL1yJHv+Ao
 daFw==
X-Gm-Message-State: AOJu0YwWMha0z2Lyx9vZ/iqwRxgsNg3vmhjbjokTfSO5fWqLBgKgcvsO
 ZJC2VelsSxl2uxKosrI2c3qJqa3mVUH7+KEvaYXXIohvScba57cPEnQRCTH8aOo3eVufVfroMII
 NmC8MB1BOQhTJBYDimY4xXCD8zwOykjc=
X-Gm-Gg: ASbGncuTNcauYns8Ktt05vraihWUSlHOKX7g28XKtfOn3kpy47PguxCwkdZh11lBFHq
 xku2hixsgV7EW4AykFVADU98Kr1AVKoBSmAI7pPNd1KscKzRl+/AqxjoczCivcml9NhF2KdE7yB
 GMSCeWmXfRzNAzGAWnrM24lVswSCHm+nXVN6sCpNWbxLegUx0KzeuYSpCSzZDWkPuFFBzNAMcpy
 bFyHqtQvpwznuSunIY8FU4LVKfOeaAbiV6a0hbw
X-Google-Smtp-Source: AGHT+IF3K+3TbtDk3dLuD6OeyCRPvMu7Lvn8pky+XKcd6S60lQlNZrzDYQqX/ZmrJVW+eZX1VYQltq51vaOdQeXXKBw=
X-Received: by 2002:a05:6871:c708:b0:2d6:109d:2598 with SMTP id
 586e51a60fabf-2ff267485f9mr4177867fac.5.1752283846912; Fri, 11 Jul 2025
 18:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250711093015.28785-1-krakow20@gmail.com>
 <DB9F9VX833TY.1UG2ZE2K2ZGNQ@kernel.org>
In-Reply-To: <DB9F9VX833TY.1UG2ZE2K2ZGNQ@kernel.org>
From: Rhys Lloyd <krakow20@gmail.com>
Date: Fri, 11 Jul 2025 18:30:36 -0700
X-Gm-Features: Ac12FXzVkzkejdHxkvnE5qELuT456HapzQsx7LLMKhM9Rqas2gGBC_FFvDVzVRM
Message-ID: <CAH7AjUyHZnf96D5wSeX6pi-YmqrqhY1HGymvkugFeU7-ne4MfA@mail.gmail.com>
Subject: Re: [PATCH] gpu: nova-core: fix bounds check In
 PmuLookupTableEntry::new, 
 data is sliced from 2..6, but the bounds check data.len() < 5 does not
 satisfy those bounds.
To: Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org, acourbot@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:51 +0000
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

Hi Danilo,
I didn't understand the maintainers list yesterday, so all the patches
I sent are missing mailing lists and recipients.  I sent a second copy
as requested in
https://gitlab.freedesktop.org/drm/nova/-/merge_requests/4#note_3003142,
and my mailing list mistakes were pointed out in detail.  I also sent
a fixed up v2 to the rust-for-linux mailing list only.  If I need to
send out another copy let me know, thanks.

On Fri, Jul 11, 2025 at 11:03=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> Hi Rhys,
>
> On Fri Jul 11, 2025 at 11:30 AM CEST, Quaternions wrote:
> > Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
>
> Thanks for your contribution.
>
> When sending patches, please make sure to follow the kernel's patch submi=
ssion
> guidelines [1].
>
> In particular, please stick to short and meaningful commit subject, follo=
wed by
> a commit description, even if the patch is simple and obvious.
>
> Also make sure to run ./scripts/checkpatch.pl and ./scripts/get_maintaine=
r.pl to
> get your patches checked and find the correct list of people to send them=
 to.
>
> Finally, please also consider the Rust submit checklist [2].
>
> Thanks,
> Danilo
>
> [1] https://docs.kernel.org/process/submitting-patches.html
> [2] https://rust-for-linux.com/contributing#submit-checklist-addendum
