Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8282456EDC
	for <lists+nouveau@lfdr.de>; Fri, 19 Nov 2021 13:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27C56F3FA;
	Fri, 19 Nov 2021 12:31:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EBE6F3F7
 for <nouveau@lists.freedesktop.org>; Fri, 19 Nov 2021 12:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637325114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vfnGDxfnfvifdRKvLtEbdxJd2nzneZBAxxOlz+EHxmA=;
 b=hR1Cx4YmFPSgCPtFiDPhlYThiCVTFHDk3u9pDLvzovv+e0uTuj1AaKU4Dq4k3SvmIeMIdu
 Gt0riGnRbqyNbxoCBU4VLXW0/4IVFYnlS+hXfPFnAAUcwPHAmjBGQFRw6wOUXwLqk/Nzvx
 NgMpSH+jjV+SBja0IKB02lYrVJXQJzw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-x_8diw9IML-JoFg3OqWq4A-1; Fri, 19 Nov 2021 07:31:53 -0500
X-MC-Unique: x_8diw9IML-JoFg3OqWq4A-1
Received: by mail-wr1-f71.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso1747807wrj.12
 for <nouveau@lists.freedesktop.org>; Fri, 19 Nov 2021 04:31:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vfnGDxfnfvifdRKvLtEbdxJd2nzneZBAxxOlz+EHxmA=;
 b=uIdob9ENJVtrrjcTNrsKRwZS8m3IMzkGNtwrLLtuQ6O7AOFWysdu/mcjrAcjSAvW7I
 FbqHB6xexb8GoLaX0bW/DYUseY0pR1d4We+rECSFg51el+tBHLkIZwWyNyFNY6NnImtA
 7vKclm8Ur5PsjBqu6crz7++DlcAhJkm2GoMATwSskiKjakd6JjWWvEQNA6Y+zHh7iLPm
 amy4fZ2wiZozwkx3nJBD7EqpwIoNrdHzJ/hWAzO6pz/2jCFITXH3nvw/JM4U2K5t9whB
 qInIW9i+99UYfmOi0nk3qt87hLn37NKQz9tdF53W4r/gOaMqKK6zEwf/W10OM2jfey0S
 xFmw==
X-Gm-Message-State: AOAM533XVIaXACOsM7ovKkFFSQAmn255SV7b8y0A7On0S0XuWnJ6bIbz
 mOsgtd4+ok1RwB1bV4MCuJiYmxOY2wYfvXLbPH4OY18lGl7PURXpotxgslbzND+lA0RNEQ45nGk
 i6nhQklwRz02JNuHXErq/RWukWquxfiuJH+EidYjCqA==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr6837587wrw.116.1637325112273; 
 Fri, 19 Nov 2021 04:31:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0SIaWgRaNniIbiwHuWI2EDNVHkM2V4r4jT8SLNi1Bc4qRpBQSrG49mDLVx5hbvAhn2VDb+tbZplMqHbUzfWI=
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr6837552wrw.116.1637325112019; 
 Fri, 19 Nov 2021 04:31:52 -0800 (PST)
MIME-Version: 1.0
References: <19065a66-ce89-b9b9-d534-eb2cabff7825@urv.cat>
 <CACO55tuWxXJoWJk-V11f-bb+6akfjBYiG8L0RoCZfRiceo9N5Q@mail.gmail.com>
 <3f418b50-e731-ff71-dc93-b065f9be8389@urv.cat>
In-Reply-To: <3f418b50-e731-ff71-dc93-b065f9be8389@urv.cat>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 19 Nov 2021 13:31:41 +0100
Message-ID: <CACO55tsqBSSzyeyJbS-81rO4=JXtdJxz_vOHoc-f7rvVwZdLog@mail.gmail.com>
To: dmanye <dmanye@urv.cat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [INVALID_ARG] mthd 0414
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 9:10 AM dmanye <dmanye@urv.cat> wrote:
>
> On 18/11/21 16:13, Karol Herbst wrote:
> > On Thu, Nov 18, 2021 at 2:59 PM dmanye <dmanye@urv.cat> wrote:
> >> hello,
> >>
> >> i have a problem and i think that it is in the nouveau driver. i hope
> >> you can help me...
> >>
> >> i have 20 identical computers with debian bullseye (11) installed (only
> >> "official" debian packages). sometimes some of them boot but the screen
> >> is remains in black. if i connect remotely i can see that the X session
> >> starts as expected (i have set a lightdm autologin). restarting lightdm
> >> does not help, but rebooting the computer solves the problem but it
> >> reappears here and there (when i boot all the computers, between 0 and 2
> >> usually get the black screen).
> >>
> > What kind of connector are you using? I have a gk208B GPU here so I
> > could see if I hit this bug if I just reboot often enough on 5.10
>
> i'm using vga cables. when the bug appears i can confirm with other
> computer that is not a cable/monitor problema. should i try other
> connector when the bug appears in case it chooses other output by
> mistake...?
>
> thanks.
>

yeah.. not quite sure yet. I tried it out with my gk208b gpus, but
couldn't hit anything. Maybe using VGA makes the difference here. Or
something else is different. Might also already be fixed in 5.16...
too many unknowns still. I will do another round of testing with VGA
and see how that ends.

> >
> >> i've noticed that this three lines appear always in dmesg when it fails:
> >>
> >> [    4.090415] nouveau 0000:07:00.0: disp: chid 0 stat 00004414 reason 4
> >> [INVALID_ARG] mthd 0414 data 00000000 code 00000001
> >> [    4.090430] nouveau 0000:07:00.0: disp: chid 0 stat 10004418 reason 4
> >> [INVALID_ARG] mthd 0418 data 00000000 code 00000001
> >> [    4.090445] nouveau 0000:07:00.0: disp: chid 0 stat 10004424 reason 4
> >> [INVALID_ARG] mthd 0424 data 00000000 code 00000001
> >>
> >> i can solve it without rebooting by unloading and loading again the
> >> nouveau driver
> >>
> >> kernel version is 5.10.46-4
> >>
> >> nouveau driver debian package is 1:1.0.17-1
> >>
> >> i attach dmesg log in case it could help.
> >>
> >> please don't hesitate to ask for more info if you need it.
> >>
> >> thank you in advance.
> >>
> >>
>

