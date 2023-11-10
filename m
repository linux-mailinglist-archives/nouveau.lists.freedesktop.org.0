Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 079F87E7C47
	for <lists+nouveau@lfdr.de>; Fri, 10 Nov 2023 13:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1C810E08C;
	Fri, 10 Nov 2023 12:53:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBAD10E08C
 for <nouveau@lists.freedesktop.org>; Fri, 10 Nov 2023 12:53:02 +0000 (UTC)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B9FF240C37
 for <nouveau@lists.freedesktop.org>; Fri, 10 Nov 2023 12:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1699620780;
 bh=rQz1XEF+09FV0wYKQEHG4CRIbx1Q7DTh+y5gnO8WcbM=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=wHEDBtfKxP8I4v1PPlFHdc57CXNQ5DLTw0Abf49NrAjma5acjL1es+d0TwvCo1ooJ
 JtJLYUkXAZTSGV+6ZN0MjfNL6mjVsRYxgsqgym7P9ft9i9p1GKZWWljXEi29xuVdiF
 iKZGo2HkB2XwDVSBzJyEbVIL39wR+bNqhis/Krep6/iv4jF0+qd83oNi1IGolHWbNl
 cJQXva9akeoGdCPCotu5jfoOTVcJ5lm/gFAwYsRvBKFvliA1t62rimlyq3Z0pErMGb
 1jcZI9mcySEwsMnZ9nIPbDi7wgyqXBwmpsQ4ybI2FqhntQ50Q3ksiWCHiuZCxbxLto
 Cgf+RsCNQqN4g==
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-28032fd5866so2005810a91.2
 for <nouveau@lists.freedesktop.org>; Fri, 10 Nov 2023 04:53:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699620779; x=1700225579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rQz1XEF+09FV0wYKQEHG4CRIbx1Q7DTh+y5gnO8WcbM=;
 b=WQttSfqpliUIbUrOsSsZp4WV/Nq3WyuDeu7WGL55TpS2zm+Wk8jqIF4GARwti70cLV
 9vQd8xpxi6zfC09ZPYDBMlv6yvWM6goCwemC3KduImCR1xKWlhK+zq1J7TjPHZ2w+gaN
 GYeQWFjItbi9M3bdngGMqmFaFzmtPecself96sivFqIsLimI/ObtGUAoSulc5ehsxVe/
 CsQzOnN0TsbaYkEZtubCT6+CtShugnBszHNZPgsrnSiicAFRbAvPHzxRXqxPbLD2hOXo
 L5mEEIPnSFkzcBieGMm5ccMGb42FurKFQzcnBa57cMhoj785Fe04oHlu+CJw1h78ksGy
 8Krw==
X-Gm-Message-State: AOJu0YyA3w7eO1mUZxOInlOX6bBDGKRsYx/9PQZJLoueWecThF1kKbvQ
 P4JnPmGTCEyed8Zy9meRIWQ3V53L+S+VH5PWtLZanfAi7uJr9VbXyMG8U+RSjBdE6a/mYej6FRw
 oSBULbPq0vv5JkghgWxNTp4hSAC9JV0HbdLmZhxmClIlRAnpERp0Wd7vyuvk=
X-Received: by 2002:a17:90b:1d03:b0:280:4799:a841 with SMTP id
 on3-20020a17090b1d0300b002804799a841mr4829841pjb.38.1699620779361; 
 Fri, 10 Nov 2023 04:52:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnczUq1VC3lW8Z/p4H5gQI8h4wKRWrRJatMYBw6a+WKwY+ovLUCuSr/qS2Bo2wOsiAR0FM2aGrvUeOcuVrw2E=
X-Received: by 2002:a17:90b:1d03:b0:280:4799:a841 with SMTP id
 on3-20020a17090b1d0300b002804799a841mr4829828pjb.38.1699620779062; Fri, 10
 Nov 2023 04:52:59 -0800 (PST)
MIME-Version: 1.0
References: <9f36fb06-64c4-4264-aaeb-4e1289e764c4@owenh.net>
 <CAAd53p7BSesx=a1igTohoSkxrW+Hq8O7ArONFCK7uoDi12-T4A@mail.gmail.com>
 <a592ce0c-64f0-477d-80fa-8f5a52ba29ea@redhat.com>
In-Reply-To: <a592ce0c-64f0-477d-80fa-8f5a52ba29ea@redhat.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 10 Nov 2023 14:52:45 +0200
Message-ID: <CAAd53p608qmC3pvz=F+y2UZ9O39f2aq-pE-1_He1j8PGQmM=tg@mail.gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
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
 linux-acpi@vger.kernel.org, "Owen T. Heisler" <writer@owenh.net>,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Hans,

On Fri, Nov 10, 2023 at 2:19=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi All,
>
> On 11/10/23 07:09, Kai-Heng Feng wrote:
> > Hi Owen,
> >
> > On Fri, Nov 10, 2023 at 5:55=E2=80=AFAM Owen T. Heisler <writer@owenh.n=
et> wrote:
> >>
> >> #regzbot introduced: 89c290ea758911e660878e26270e084d862c03b0
> >> #regzbot link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/273
> >> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218124
> >
> > Thanks for the bug report. Do you prefer to continue the discussion
> > here, on gitlab or on bugzilla?
>
> Owen, as Kai-Heng said thank you for reporting this.
>
> >> ## Reproducing
> >>
> >> 1. Boot system to framebuffer console.
> >> 2. Run `systemctl suspend`. If undocked without secondary display,
> >> suspend fails. If docked with secondary display, suspend succeeds.
> >> 3. Resume from suspend if applicable.
> >> 4. System is now in a broken state.
> >
> > So I guess we need to put those devices to ACPI D3 for suspend. Let's
> > discuss this on your preferred platform.
>
> Ok, so I was already sort of afraid we might see something like this
> happening because of:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D89c290ea758911e660878e26270e084d862c03b0
>
> As I mentioned during the review of that, it might be better to
> not touch the video-card ACPI power-state at all and instead
> only do acpi_device_fix_up_power() on the child devices.

Or the child devices need to be put to D3 during suspend.

>
> Owen, attached are 2 patches which implement only
> calling acpi_device_fix_up_power() on the child devices,
> can you build a v6.6 kernel with these 2 patches added
> on top please and see if that fixes things ?
>
> Kai-Heng can you test that the issue on the HP ZBook Fury 16 G10
> is still resolved after applying these patches ?

Yes. Thanks for the patch.

If this patch also fixes Owen's issue, then
Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>


>
> Regards,
>
> Hans
>
