Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6983309F1
	for <lists+nouveau@lfdr.de>; Mon,  8 Mar 2021 10:05:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C636E830;
	Mon,  8 Mar 2021 09:05:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9085E6E830
 for <nouveau@lists.freedesktop.org>; Mon,  8 Mar 2021 09:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615194310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=whMuiJcZxpCbsHAI55+vsgV+j3btjC7rS5eVuIYWZds=;
 b=Okjo4Qy3M2hM4KxWOdG2jOlUh+/CGvjT2v9mxNumdGxgTDc4Hj2kWQnFBAUKQ3ZEjudxBm
 CwPYXLExTZUfyZvDBBCzRHwfD6T5YIaOszXndLwxs6JLNj8Z1zeXE8etKVzZg0rc+AF26j
 +ByjxaeDw5lCFHmnWAifd4kSBXPZmZc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-hreA03HKPZKdhEsuZafybg-1; Mon, 08 Mar 2021 04:05:06 -0500
X-MC-Unique: hreA03HKPZKdhEsuZafybg-1
Received: by mail-wr1-f71.google.com with SMTP id e29so4531337wra.12
 for <nouveau@lists.freedesktop.org>; Mon, 08 Mar 2021 01:05:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=whMuiJcZxpCbsHAI55+vsgV+j3btjC7rS5eVuIYWZds=;
 b=oxge4bM0ctxmV7BRwREDWUpK5b8Lv/OKOr1+4KEIH3huF4ZQLqnv3S6IZp2WTofEpk
 mAJgJo7KmYEqbVL6WqOfP1xG09lGz3LtbUIqmWFuAejQXBofHj2N1LsDDh7WE9UIi/HR
 CsrsTzVq7zfc/7hQRxNv8lTEPBM8+xG2MWrfPV59RQlhWANxXGo1rzbWVXG+JirJ/M6B
 /sgYxKme1L4q3ZuIGlWkxBS9GpmFVtgE9bulSEclPFUOcuFNzwfJXnKTTPmyVAwlaRbW
 345mJWRSMrJKA/afUnIHUt1UJQHogu+CH0ln8ZaEAusaf0l19/rnUpSNoSC/TLwnH/lo
 Mx/A==
X-Gm-Message-State: AOAM5334afBTgnVoF4o52/oQXHl4Vj0/1wuE64Hid3YwKrGB0znYA0RH
 puAfnM/YBAdX/je67hAVbT2rRMQGEU4ydIrZ1jC6J9lF7OpLhrQQqQQRmUebzOMPkEAc6pdSNgw
 9nQ/scjlWFAt2QWRsJej1L5uIkNh9/2B9wyq2lFdaYw==
X-Received: by 2002:a05:600c:220d:: with SMTP id
 z13mr21190399wml.1.1615194305161; 
 Mon, 08 Mar 2021 01:05:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDoQUGCmcCxQ4fIcJR3zD8r+EVdzivPB3gGsPqHcVbLn6pILClS0xrfseTVqEbRLwr0C35hm6RWwcADxslo+Y=
X-Received: by 2002:a05:600c:220d:: with SMTP id
 z13mr21190384wml.1.1615194305015; 
 Mon, 08 Mar 2021 01:05:05 -0800 (PST)
MIME-Version: 1.0
References: <CAPpdf59bkxEQ9+iozLOc0o51w2h1e1jJhSROH-91YAEry3k8cw@mail.gmail.com>
In-Reply-To: <CAPpdf59bkxEQ9+iozLOc0o51w2h1e1jJhSROH-91YAEry3k8cw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 8 Mar 2021 10:04:54 +0100
Message-ID: <CACO55tu4PtcVCdUta2MXr9UQQA2nCrmL4-O6btD2F4d_=zUMKA@mail.gmail.com>
To: o1bigtenor <o1bigtenor@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] Request for information and/or assistance
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Mar 4, 2021 at 3:21 AM o1bigtenor <o1bigtenor@gmail.com> wrote:
>
> Greetings
>
> Running debian testing, 2 nvidia gpus (GP107 and GF110) and 5 monitors
> (1 - 3840x2160 and 2 1920x1080 on the GP107 and 2 - 1920x1080 on the
> GF110) using one screen (7680x3000).
>
> I would still like to modify some things but can't find any docs on
> how to do that and my attempts have only made things worse and I can
> function, even though some things are right awkward, on the system.
> What I've run into is that my graphics system either refuses to come
> out of hibernation or decides to come back on but in a locked state. I
> then log into this machine from another on the network and do a reboot
> for a 'graceful' restart (rather than use the kill button - - - the
> hard shut off).
>
> This event, graphics shutdown, is happening in direct relationship to
> how much I have happening on the desktops of which I have lots.
>
> In searching it seems that nouveau support for the GP107 is not yet
> complete - - - - or that's what it seems like.
>
> Is there someone out there who has some idea what the problem is?
> (There are quite a number of different individuals mentioning this
> issue in one of the bug reports.)
>
> I would be happen to revise the nouveau pages on xrandr updating the
> information from 1.3 to 1.5 and possibly some of the other pages as
> well. I have no programming skills but I do have reasonable writing
> skills - - - - would rather trade than to continue taking that 1/2
> hour it takes to set my system up after each reboot - - - - taking an
> hour or even 1.5 hours a day doing this is a huge drain on my
> resources and would rather change this.
>
> Please advise!
>

I think at this point we can only guess what's going on there and
having system logs would help us figure out what's wrong. Mind sharing
system logs from the time the crash or whatever that is happens?
Output of dmesg via ssh could be enough.

> Regards
>
> Aj
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
