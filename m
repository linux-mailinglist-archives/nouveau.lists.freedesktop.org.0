Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C247B7E7920
	for <lists+nouveau@lfdr.de>; Fri, 10 Nov 2023 07:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C80C10E694;
	Fri, 10 Nov 2023 06:19:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 566 seconds by postgrey-1.36 at gabe;
 Fri, 10 Nov 2023 06:19:13 UTC
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067C010E694
 for <nouveau@lists.freedesktop.org>; Fri, 10 Nov 2023 06:19:13 +0000 (UTC)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A14C040C51
 for <nouveau@lists.freedesktop.org>; Fri, 10 Nov 2023 06:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1699596585;
 bh=dbMwBXBmEotT6dk1rDXulRhL3RKiFgxFvFzDuEEcJx8=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=KZM9uTxedJKiGXsELffIS/EpGGq5PCy6sEcg7yGMzuYDs7q2U3LhdT0a2xYjwo4Q0
 qysXrhOCgaDgXqyVAOM3oonLI5lCPq2Q/Zr6c5DLdHv15OnvFmEEmxTfGJlj3RVCt1
 UCeb7chPeGX4ugVH1xtOmr+sIfevvV4QOtsJjxcIAteoiEHZA8e1tPFUQwD2Bvd/Sg
 9QS5EE/NpPOY3jlf02EdiSNYk43mLJQJIwIaFACL9LOrjRVsiARyUurdPCo8nrvSdC
 LRozsIJGj16Ay1HdAr8eraT6N/v0Kv/d8dQPw6zsTRWmArDVOgHbVLfDf1iRLgZkj1
 WlOrssekXx8pA==
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-27ffe79ec25so1686977a91.2
 for <nouveau@lists.freedesktop.org>; Thu, 09 Nov 2023 22:09:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699596584; x=1700201384;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dbMwBXBmEotT6dk1rDXulRhL3RKiFgxFvFzDuEEcJx8=;
 b=kT5Yb7nlOt+9TpntNasPCW4ySy1QyJABNFL302ojsDPXjwmx0mEV391jd87NK2R+RA
 2xxFb3RqyAAqFkAQ4MTDbR5JsCfBCx14f6Bl+k5A0WOhdh6tTXfy1ZaKp5GJVAxYLZTq
 O5SZmidoNnzjWoOIuA9Fg2gW5o7NOIBmLtPf2A3YdGkfFjVt41X6alXUVkL9orAUfbcy
 ArQUPSa/qoXFok3L0UYyo1AL+WeVFnkOvDgLhpvJ5BcYmbAVsKGJ7Uzkpu5TczV6kI9S
 BKBAhV6uJs0b8KUDAhs7eCuzQbJpEyeGHiB4OO823FAibEC1KA6YYQxkaZkx5F8f0ztH
 UYiA==
X-Gm-Message-State: AOJu0Yy+nXLNOf6ErfUbUlcU0X0jjAQ2UARLzMh5i53Id6EvEBlxENS2
 KshhV+RtHKmxU59j5ROV+d1/pY8zlcgcPhNlRo8ZTJydmSzmuEXaa85NQD6v/IP4eYAHIqVYcXS
 ae/R8Bb/4YmT0ttMnBkDUhmJcjBYbgkrgypeWOoeXS+TnPLJgixKdWEZLkOI=
X-Received: by 2002:a17:90b:4c85:b0:280:6296:3d96 with SMTP id
 my5-20020a17090b4c8500b0028062963d96mr3622956pjb.41.1699596583968; 
 Thu, 09 Nov 2023 22:09:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1wROyFVtufgqw/ZeSGGAbm8xifOocKozGCKWAhapxnMtc++Zwn+hYm7Zub9ci/y6pKeOOqpv3+EKkV4NfDoY=
X-Received: by 2002:a17:90b:4c85:b0:280:6296:3d96 with SMTP id
 my5-20020a17090b4c8500b0028062963d96mr3622942pjb.41.1699596583634; Thu, 09
 Nov 2023 22:09:43 -0800 (PST)
MIME-Version: 1.0
References: <9f36fb06-64c4-4264-aaeb-4e1289e764c4@owenh.net>
In-Reply-To: <9f36fb06-64c4-4264-aaeb-4e1289e764c4@owenh.net>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 10 Nov 2023 08:09:11 +0200
Message-ID: <CAAd53p7BSesx=a1igTohoSkxrW+Hq8O7ArONFCK7uoDi12-T4A@mail.gmail.com>
To: "Owen T. Heisler" <writer@owenh.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [REGRESSION]: acpi/nouveau: Hardware unavailable upon
 resume or suspend fails
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
Cc: regressions@lists.linux.dev, nouveau@lists.freedesktop.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, stable@vger.kernel.org,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Len Brown <lenb@kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Owen,

On Fri, Nov 10, 2023 at 5:55=E2=80=AFAM Owen T. Heisler <writer@owenh.net> =
wrote:
>
> #regzbot introduced: 89c290ea758911e660878e26270e084d862c03b0
> #regzbot link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/273
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218124

Thanks for the bug report. Do you prefer to continue the discussion
here, on gitlab or on bugzilla?

>
> ## Reproducing
>
> 1. Boot system to framebuffer console.
> 2. Run `systemctl suspend`. If undocked without secondary display,
> suspend fails. If docked with secondary display, suspend succeeds.
> 3. Resume from suspend if applicable.
> 4. System is now in a broken state.

So I guess we need to put those devices to ACPI D3 for suspend. Let's
discuss this on your preferred platform.

Kai-Heng

>
> ## Testing
>
> - culprit commit is 89c290ea758911e660878e26270e084d862c03b0
> - v6.6 fails
> - v6.6 with culprit commit reverted does not fail
> - Compiled with
> <https://gitlab.freedesktop.org/drm/nouveau/uploads/788d7faf22ba2884dcc09=
d7be931e813/v6.6-config1>
>
> ## Hardware
>
> - ThinkPad W530 2438-52U
> - Dock with Nvidia-connected DVI ports
> - Secondary display connected via DVI
> - Nvidia Optimus GPU switching system
>
> ```console
> $ lspci | grep -i vga
> 00:02.0 VGA compatible controller: Intel Corporation 3rd Gen Core
> processor Graphics Controller (rev 09)
> 01:00.0 VGA compatible controller: NVIDIA Corporation GK107GLM [Quadro
> K2000M] (rev a1)
> ```
>
> ## Decoded logs from v6.6
>
> - System is not docked and fails to suspend:
> <https://gitlab.freedesktop.org/drm/nouveau/uploads/fb8fdf5a6bed1b1491d25=
44ab67fa257/undocked.log>
> - System is docked and fails after resume:
> <https://gitlab.freedesktop.org/drm/nouveau/uploads/cb3d5ac55c01f663cd80f=
a000cd6a3b5/docked.log>
