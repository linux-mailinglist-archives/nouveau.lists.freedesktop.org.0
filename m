Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D076E27FE8A
	for <lists+nouveau@lfdr.de>; Thu,  1 Oct 2020 13:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411B66E89D;
	Thu,  1 Oct 2020 11:37:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E216E19B
 for <nouveau@lists.freedesktop.org>; Thu,  1 Oct 2020 11:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601552237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4eXjspHxv+ABlMMFfGR7GC9CAx8SFwxNxhFzCnX2S94=;
 b=Nlb8HKM/hPVRfqAFt+B86EWd96pO6sYKROKF2Ih23IQtD0ERr9OMUa1By9Lteb0kLY7luO
 nXPDanZDQSuRw9cGaWViJjtxd3vD/P2eO3M6Va7EJFSUnVig6HZsGalDcogSmBuzgOfIB1
 R1f+/8oi6dZPoM9dStF7AQpvKBFr9Ro=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-K0MUIcSaNCGGpUwu0958Hw-1; Thu, 01 Oct 2020 07:37:04 -0400
X-MC-Unique: K0MUIcSaNCGGpUwu0958Hw-1
Received: by mail-qk1-f199.google.com with SMTP id m186so2812640qkf.12
 for <nouveau@lists.freedesktop.org>; Thu, 01 Oct 2020 04:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4eXjspHxv+ABlMMFfGR7GC9CAx8SFwxNxhFzCnX2S94=;
 b=nJdfnh2It+ry0IaoHOiLxg2ueoIlgx++hYp2kHrYcccfqwFDGxHRWJBr6PbPIJ2Y4t
 yu6fHkmS1BWV12grvQir22zZcRhpMZBGeeteBn/yG4J/osJRM0cmUvLZCYP/DhppwdCA
 +EYlXZyuigexV5u0DUfNrXgsDhwMz2BoYqUymtLZfiGq7jpywqAOLLir42LkNUCuc5mb
 1ppwl/aTmoJjKr9WN5s5MNuM2L+LAi+ZPlMEO2jjhCN+yp4SzXewdSr7l0keXxlS4OyT
 PvyCMCkZLX2Bo6kKvGGyJ9I2O2Aw6D7pOgeA5TAE/uS1cdAoC5ftYv1kw/8Sr2E5AN7l
 0d/A==
X-Gm-Message-State: AOAM532M64LKwSuToEme86lym5XW22JY1E8fgmRt6kiG++HiTDHpxEHm
 MydS4/6KKp6kdkZqsXlZyqHlK3tKmIX/blaqfSl5FPLO83/QjDUuzIHzN1FNLenLRhVsSg2Fc9d
 9MPH4rr24pnNq+c2m5trxEKkol/64Kauup46EYqQFKg==
X-Received: by 2002:ac8:411c:: with SMTP id q28mr7089447qtl.254.1601552223878; 
 Thu, 01 Oct 2020 04:37:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsKkx5koDNootQdIEJCZxyYrvPYIZj5X0DvstXn2raHaIPYrbdSVeG2Y3iLhXbvVGXMXmh2o9a+wwNYiFz1LU=
X-Received: by 2002:ac8:411c:: with SMTP id q28mr7089424qtl.254.1601552223535; 
 Thu, 01 Oct 2020 04:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55ts6hfd_v8V8_yJ45wm8MAN7TENL9pZZmijFaB3h-FrR=A@mail.gmail.com>
In-Reply-To: <CACO55ts6hfd_v8V8_yJ45wm8MAN7TENL9pZZmijFaB3h-FrR=A@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 1 Oct 2020 13:36:52 +0200
Message-ID: <CACO55tviMespp4FNko+2ipmx0DNx4de2WKSrmEW05EufW7P_ZA@mail.gmail.com>
To: nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] Nouveau wiki migration
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
Cc: Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Sep 25, 2020 at 11:27 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> Hi everybody,
>
> I think it's time to finally move our wiki from the old infrastructure
> over to gitlab pages.
>
> This comes with several benefits:
> * full control through git over the ikiwiki pipeline (setup files,
> plugins, system packages, ...)
> * random users are able to create MRs against the wiki as long as they
> are willing to create a gitlab account.
> * possible to migrate over to a different wiki generator or mix and
> match or whatever.
> * no CGI stuff on the wiki as we don't use ikiwiki for the git
> operations anymore
>
> To view the migrate wiki visit this URL:
> https://nouveau.pages.freedesktop.org/wiki/
> the gitlab project lives here: https://gitlab.freedesktop.org/nouveau/wiki
>
> There are a couple of changes I already made:
> * convert the perl ikiwiki setup file to yaml:
> https://gitlab.freedesktop.org/nouveau/wiki/-/blob/master/nouveau.yml
> * reworked the setup file to throw out unused plugins and adjust
> settings for gitlab
> * enabled HTML5 (does change the style slightly, but also fixed some
> regressions)
> * pulled in external sources (from the fdo.org server)
> * moved mdwn files into their own subdirectory
>
> For now I changed everything inside one big commit:
> https://gitlab.freedesktop.org/nouveau/wiki/-/commit/6f2d1669884af186863718ad827f65372a0c5c43
>
> There are a couple of remaining issues/questions:
> * the gitlab CI pipeline fails quite a bit, which could be annoying
> * there is a delay between editing and changes going live (usually
> below a minute though)
> * should we disallow direct editing of files for project members so we
> could CI the changes are still valid?
>
> Next steps:
> * verify everything still works
> * fix remaining issues
> * final step: point the subdomain to the new gitlab pages URL
>
> If anybody else is interested in moving their wikis over, don't
> hesitate to ask me questions or just copy whatever I did :)

I did some further changes, like ensuring backwards compatibility to
existing links and already started to clean up some bits, like
removing the google translate stuff.

Now I'd like to get the subdomain changed of the current wiki over to
the gitlab stuff and wanted to ask for acks/nacks on this

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
