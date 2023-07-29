Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AF8768190
	for <lists+nouveau@lfdr.de>; Sat, 29 Jul 2023 21:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBCB10E227;
	Sat, 29 Jul 2023 19:51:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AD110E227
 for <nouveau@lists.freedesktop.org>; Sat, 29 Jul 2023 19:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690660268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cWWhCgV5CxK6aTCEQnLFnWxDZed/a8gDNkQpS5Cx0s8=;
 b=b2UwY345rfqa7peO9/qzHXRH3YwkixqvzKfJ3ZlxZJSa10Lr8n0JbZuYtcbubnjPwuaKYu
 u4sx9iR92hse715oVFR7ZmASgZCzTUrxRbhahOLNuzC6F12bXdJscNzhEtGzdi4tANy79p
 1HmCsXFwaKf6oTDrstkwex0/yZiiR9w=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-BKSDtojuNqSGkKnx6N69bA-1; Sat, 29 Jul 2023 15:51:06 -0400
X-MC-Unique: BKSDtojuNqSGkKnx6N69bA-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b04d5ed394so4947621fa.1
 for <nouveau@lists.freedesktop.org>; Sat, 29 Jul 2023 12:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690660264; x=1691265064;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cWWhCgV5CxK6aTCEQnLFnWxDZed/a8gDNkQpS5Cx0s8=;
 b=cXznavIDY4XVZGpyAjBQzJGJIq0PlEFQzssbmClKOaCMTP549Kcj8CJKsZkJnYKuwh
 2ZmXi+Hf2YgZ387H2qfdn2UD85NjI80sqHvDjjhErpstY6Wwtwdywj8b1MchrEAfyjdW
 fpLeiqQB+sceLtrXfLKum7l/jr8kxdBGS34ocDwbVts0WDk/xth7dAI/j8GFJQuu3ADj
 FKhOZflhVNEYhg5v2sZa80kxceUIgQ2qLSyzo0yCbbAbufVghnZ4MQ2DGCZe0nAAZDVf
 tc9MawsRO3+VmQHaRkqU/ewnbtzqHVePrg/LWkKepg6YWECUEhbMdZ8O9rBxvpVCw4o1
 viUA==
X-Gm-Message-State: ABy/qLae1vcntvvGEz+gGTO9HimNgKcft0zXCDR7/sCqUxupBZeJ+Ali
 hEmMdQI1ytcHCwd49AgH0OrXND5p6FWOaciUFiBJEhhRxlKu+jblXHHLuap58t0ZwCLgFpSsq+/
 skoHFKgVuiyKrUuFgebafrfZ8dmx0tTGFRz9JdtJROjPHL62Eyg==
X-Received: by 2002:a2e:a7cf:0:b0:2b6:9969:d0ab with SMTP id
 x15-20020a2ea7cf000000b002b69969d0abmr1585482ljp.4.1690660264577; 
 Sat, 29 Jul 2023 12:51:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGQB3+EzBuM413yKQ2elzz8QdKL+Qo2meLk57bFy/PJOenV9jc/BDTSjhlTPTNBtAw86vYgz2TOp425mKeOe/I=
X-Received: by 2002:a2e:a7cf:0:b0:2b6:9969:d0ab with SMTP id
 x15-20020a2ea7cf000000b002b69969d0abmr1585478ljp.4.1690660264307; Sat, 29 Jul
 2023 12:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <875y8dlep1.fsf@fin.soreny> <87o7l7i1t9.fsf@fin.soreny>
 <CACO55tua9PqFTVjU4yhN6DVvrMwSSuZOQ3nicaXDVS0uoDX_+Q@mail.gmail.com>
 <87ila2wqm8.fsf@fin.soreny>
 <CACO55ts7PYurbcPwebOzKxKVWGLLyT96p-=36pi6Mkc5kM_apQ@mail.gmail.com>
In-Reply-To: <CACO55ts7PYurbcPwebOzKxKVWGLLyT96p-=36pi6Mkc5kM_apQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 29 Jul 2023 21:50:53 +0200
Message-ID: <CACO55tsuEaFdC+OGsAsqcDDT52SKoOOTp4F9PNzSk-qu0Y6jpQ@mail.gmail.com>
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

On Sat, Jul 29, 2023 at 9:49=E2=80=AFPM Karol Herbst <kherbst@redhat.com> w=
rote:
>
> On Sat, Jul 29, 2023 at 7:54=E2=80=AFPM Ferenc W=C3=A1gner <wferi@niif.hu=
> wrote:
> >
> > Karol Herbst <kherbst@redhat.com> writes:
> >
> > > On Fri, Jun 23, 2023 at 12:12=E2=80=AFAM Ferenc W=C3=A1gner <wferi@ni=
if.hu> wrote:
> > >
> > >> Ferenc W=C3=A1gner <wferi@niif.hu> writes:
> > >>
> > >>> Sorry if I'm reaching the wrong forum, please advise if so.  My que=
stion
> > >>> is not about the main focus of this community, but I had no better =
idea
> > >>> about where to look for the relevant expertise.
> > >>>
> > >>> So: this Dell Precision 5560 laptop is built with a "T1200 Laptop G=
PU",
> > >>> and I suspect it draws power even though I don't ever use it, heati=
ng
> > >>> the computer and shortening battery life.  Is there a way to shut i=
t
> > >>> down for good?  (Or to make sure it isn't causing my problems?)
> > >>
> > >> Looks like I chose the wrong forum after all.  Shall I try the linux=
-pm
> > >> list instead, or can you recommend a more approriate one for the abo=
ve
> > >> question?
> > >
> > > The GPU should be getting powered down automatically as long as
> > > nouveau is loaded and nothing actively uses the GPU.
> >
> > Thanks for the tip, Karol!  Letting the nouveau module load doubled my
> > estimated battery time.  Online PC10 residency is still low, but that
> > must be a different issue.
>
> yeah.. the Intel stuff from that time is a bit buggy and even plugging
> in USB devices can disable PC10. You should probably try enabling
> runtime power management on all pcie devices (write "auto" into all
> /sys/bus/pci/devices/*/power/control files, each device also has a
> "status" file to tell if they are suspended or not) And maybe same
> with USB devices or something... There are also tools like tlp who
> automate that stuff, but they usually set less optimal settings when
> on power.
>
> Anyway, enabling runtime power management usually helps a bit here.
>

I think there was also some sata/nvme stuff to toggle, but can't
remember the details here. Might want to search for that.

> > --
> > Thanks again,
> > Feri.
> >

