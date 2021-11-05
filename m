Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9776D446564
	for <lists+nouveau@lfdr.de>; Fri,  5 Nov 2021 16:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A426EB46;
	Fri,  5 Nov 2021 15:02:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7B96EB45
 for <nouveau@lists.freedesktop.org>; Fri,  5 Nov 2021 15:02:32 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id c206so9514677iof.2
 for <nouveau@lists.freedesktop.org>; Fri, 05 Nov 2021 08:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bed9dTxzof0IMpmUtO3uZAlmzItlu6KeazgQeZUwsMA=;
 b=VQ5YI9LRILNyq5O4hZ81EEioY9kRTKjrFdbB4udpzEN4+ljzXkG8wKoTkxgqtbVS6R
 5r68qt3e5pcez8K9h9I79NU/9TOkXPGJqvGXaOemikdWegLmCfUdQQJIVIgnBJpAdBRb
 1Flxd/4KN+7Xy1IrZuNgKkzqS3+EJMWqd3UuPs2UaQNWD2OsF0cVdd8oBbt60iRvHKK+
 ZYWjsU+/z/xhQ43+4dIdzJRPfzYS/fOoTzaCxeJkijCIle3c2KRq5vwoEynZHGEd3m+Q
 laLpJdryIc4ua6RNgl9bwlFAMUKQJbK8+MejdBesHvTKAbIHmE5Zd6v5ZnkKI/j5SQXS
 9wlg==
X-Gm-Message-State: AOAM531HhYkSk4HB3xHdkTbTvjJFDjxbcDs5pp2qXa30laRf1WWyj1G6
 nbzIdJ7NIqTQBg0ROzE6lKjl2ZkzBjB+MHpIV0o=
X-Google-Smtp-Source: ABdhPJyCdkwRPo4L+MYuHq1Paz2jVb6COjlB6eCY3DolOl3cu2KR+xzzdATk+qXqVb209CQ3dOLMemaUn9pNhNPpps0=
X-Received: by 2002:a05:6602:3281:: with SMTP id
 d1mr43248265ioz.84.1636124550764; 
 Fri, 05 Nov 2021 08:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <CABr8-B7QAn9LV18d2HEWGqzvM3x4NcYj5rpvcXq=YsK-ozcoMQ@mail.gmail.com>
In-Reply-To: <CABr8-B7QAn9LV18d2HEWGqzvM3x4NcYj5rpvcXq=YsK-ozcoMQ@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 5 Nov 2021 11:02:19 -0400
Message-ID: <CAKb7Uvh63kpzmvKMQs7pnaWKkBVFGfO82_ZQdz-TKs0=hXuzWw@mail.gmail.com>
To: Jerry Geis <jerry.geis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Ubuntu 20.04 and vlc
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

Hey Jerry,

I'd look in the kernel log to see what's up. Perhaps the GPU hangs?

Cheers,

  -ilia

On Fri, Nov 5, 2021 at 10:42 AM Jerry Geis <jerry.geis@gmail.com> wrote:
>
> Hi All,
>
> I am using Ubuntu 20.04 with VLC... normally the box boots up runs an plays videos just fien with about 20% usage for VLC (celeron and or intel Atom hardware).
> After some time - day or two of playing videos. Something happens.
> The CPU usage jumps way up like 120% kind of usage.  Like the vdpau stuff is no longer working.
>
> Is this a know issue ?
> What should I look for  ?
> What can I provide to help ?
>
>  Intel(R) Atom(TM) CPU D525   @ 1.80GHz
> 03:00.0 VGA compatible controller: NVIDIA Corporation GT218 [ION] (rev a2)
>
> Thanks
>
> Jerry
