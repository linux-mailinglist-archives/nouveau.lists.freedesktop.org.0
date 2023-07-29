Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B057876818A
	for <lists+nouveau@lfdr.de>; Sat, 29 Jul 2023 21:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D954210E221;
	Sat, 29 Jul 2023 19:49:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F46810E221
 for <nouveau@lists.freedesktop.org>; Sat, 29 Jul 2023 19:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690660180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0fmZ8pFs9oXWzdZzG+eKurldainMR28HsXdq1To+FxE=;
 b=bt3MSshgUrdPjSphnSWJVVo7LS2urUoaFAxitDLfeyKWkqEHlc59bD+ciVkNZn3qspa5p0
 G/1yIAmt85QBiU/hMvXbT3fb/u/G9c6BS1KmSaJru4iWhxrIdMn1l5rIBLJBR1de7VQvYn
 T4mQZnBCFV0cWQffG+SDijIIggj3hNk=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-MRPXjJl_P_aclsRsDeBWcw-1; Sat, 29 Jul 2023 15:49:38 -0400
X-MC-Unique: MRPXjJl_P_aclsRsDeBWcw-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b839ca1362so7017541fa.0
 for <nouveau@lists.freedesktop.org>; Sat, 29 Jul 2023 12:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690660176; x=1691264976;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0fmZ8pFs9oXWzdZzG+eKurldainMR28HsXdq1To+FxE=;
 b=dSdmItYPN8plf8YGN+8b8TCkPet6XD10p5OAPhYpZnZyRbO11rwcH81+qxrmTXUob8
 ZiXJY4j30NUidwKXtawwSLUPs29QAfVoFt3AZkQK6XPxPnJnhdTqa7bkD3sWWcZKMdA3
 AaE7iqH4uAfazRmrELjtvgmWLBo9AhA2mqBpd4ET4CcSwlwDp+KWd/uQDc2DiQTPr3XU
 Uf9Ei3R3Y+WgsL0pkp0ho2usHvJoY+4LBah7zsnBxh0t7695UBQzzzftS9GIjDjBzn1m
 izaOzkSQUoHJ0AGYosEtozNHRO3oa92oGtvczPTr9u7lDnGJtY2Mr3vCtw7qAPMnR2d3
 ZZCw==
X-Gm-Message-State: ABy/qLYOmXSb6VrLfvKKckuiUf9xN8zfX/So3dcpSvkTscWxleq7YZYy
 Fehdaxm9djDznAaZjJ96yHPGneIGii3vF4rctAvmrqovl+jM4ZdMzOq2UgNpLccfSaVRmFGXZvP
 pBSQP9olhIM/tloaQ3Ugx4sHuBFUyw7mKuaqd+6a5nSGp0kPSfw==
X-Received: by 2002:a2e:a793:0:b0:2b8:3c52:113 with SMTP id
 c19-20020a2ea793000000b002b83c520113mr1841515ljf.5.1690660176511; 
 Sat, 29 Jul 2023 12:49:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGs1p5kccZIiqMyBGxqb14coxfjcPWdVOzxigxgmiOqgkEFXdr4bJTOy2uidq4CipF9sOswiq2ImnE4pWVQlEY=
X-Received: by 2002:a2e:a793:0:b0:2b8:3c52:113 with SMTP id
 c19-20020a2ea793000000b002b83c520113mr1841506ljf.5.1690660176123; Sat, 29 Jul
 2023 12:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <875y8dlep1.fsf@fin.soreny> <87o7l7i1t9.fsf@fin.soreny>
 <CACO55tua9PqFTVjU4yhN6DVvrMwSSuZOQ3nicaXDVS0uoDX_+Q@mail.gmail.com>
 <87ila2wqm8.fsf@fin.soreny>
In-Reply-To: <87ila2wqm8.fsf@fin.soreny>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 29 Jul 2023 21:49:24 +0200
Message-ID: <CACO55ts7PYurbcPwebOzKxKVWGLLyT96p-=36pi6Mkc5kM_apQ@mail.gmail.com>
To: =?UTF-8?Q?Ferenc_W=C3=A1gner?= <wferi@niif.hu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] Powering down laptop GPU TU117GLM
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Jul 29, 2023 at 7:54=E2=80=AFPM Ferenc W=C3=A1gner <wferi@niif.hu> =
wrote:
>
> Karol Herbst <kherbst@redhat.com> writes:
>
> > On Fri, Jun 23, 2023 at 12:12=E2=80=AFAM Ferenc W=C3=A1gner <wferi@niif=
.hu> wrote:
> >
> >> Ferenc W=C3=A1gner <wferi@niif.hu> writes:
> >>
> >>> Sorry if I'm reaching the wrong forum, please advise if so.  My quest=
ion
> >>> is not about the main focus of this community, but I had no better id=
ea
> >>> about where to look for the relevant expertise.
> >>>
> >>> So: this Dell Precision 5560 laptop is built with a "T1200 Laptop GPU=
",
> >>> and I suspect it draws power even though I don't ever use it, heating
> >>> the computer and shortening battery life.  Is there a way to shut it
> >>> down for good?  (Or to make sure it isn't causing my problems?)
> >>
> >> Looks like I chose the wrong forum after all.  Shall I try the linux-p=
m
> >> list instead, or can you recommend a more approriate one for the above
> >> question?
> >
> > The GPU should be getting powered down automatically as long as
> > nouveau is loaded and nothing actively uses the GPU.
>
> Thanks for the tip, Karol!  Letting the nouveau module load doubled my
> estimated battery time.  Online PC10 residency is still low, but that
> must be a different issue.

yeah.. the Intel stuff from that time is a bit buggy and even plugging
in USB devices can disable PC10. You should probably try enabling
runtime power management on all pcie devices (write "auto" into all
/sys/bus/pci/devices/*/power/control files, each device also has a
"status" file to tell if they are suspended or not) And maybe same
with USB devices or something... There are also tools like tlp who
automate that stuff, but they usually set less optimal settings when
on power.

Anyway, enabling runtime power management usually helps a bit here.

> --
> Thanks again,
> Feri.
>

