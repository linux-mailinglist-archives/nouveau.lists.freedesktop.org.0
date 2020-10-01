Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C162805F0
	for <lists+nouveau@lfdr.de>; Thu,  1 Oct 2020 19:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3DF6E213;
	Thu,  1 Oct 2020 17:53:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647436E213;
 Thu,  1 Oct 2020 17:53:03 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C7D622004F;
 Thu,  1 Oct 2020 19:52:58 +0200 (CEST)
Date: Thu, 1 Oct 2020 19:52:57 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <20201001175257.GA188932@ravnborg.org>
References: <CACO55ts6hfd_v8V8_yJ45wm8MAN7TENL9pZZmijFaB3h-FrR=A@mail.gmail.com>
 <CACO55tviMespp4FNko+2ipmx0DNx4de2WKSrmEW05EufW7P_ZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tviMespp4FNko+2ipmx0DNx4de2WKSrmEW05EufW7P_ZA@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=S433PrkP c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=20KFwNOVAAAA:8 a=e5mUnYsNAAAA:8
 a=cYPG-T6kBObybilq3DsA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Karol.

On Thu, Oct 01, 2020 at 01:36:52PM +0200, Karol Herbst wrote:
> On Fri, Sep 25, 2020 at 11:27 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > Hi everybody,
> >
> > I think it's time to finally move our wiki from the old infrastructure
> > over to gitlab pages.
> >
> > This comes with several benefits:
> > * full control through git over the ikiwiki pipeline (setup files,
> > plugins, system packages, ...)
> > * random users are able to create MRs against the wiki as long as they
> > are willing to create a gitlab account.
> > * possible to migrate over to a different wiki generator or mix and
> > match or whatever.
> > * no CGI stuff on the wiki as we don't use ikiwiki for the git
> > operations anymore
> >
> > To view the migrate wiki visit this URL:
> > https://nouveau.pages.freedesktop.org/wiki/

I poked around a little - almost all of it looked good.

The FAQ points back to some pages on https://nouveau.freedesktop.org -
like https://nouveau.freedesktop.org/wiki/XvMC/
I guess this is a bug.

But in general looks good.

> I did some further changes, like ensuring backwards compatibility to
> existing links and already started to clean up some bits, like
> removing the google translate stuff.
> 
> Now I'd like to get the subdomain changed of the current wiki over to
> the gitlab stuff and wanted to ask for acks/nacks on this

No ack/nack here - as I really do not know what to ack/nack.
But maybe the above counts like an ack???

But looks good and I hope that others find it simple to help
with the pages from the gitlab repo.

	Sam
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
