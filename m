Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C8D1E5B90
	for <lists+nouveau@lfdr.de>; Thu, 28 May 2020 11:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B746E44A;
	Thu, 28 May 2020 09:14:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Thu, 28 May 2020 09:14:37 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6466E44A
 for <nouveau@lists.freedesktop.org>; Thu, 28 May 2020 09:14:37 +0000 (UTC)
Received: from mail-qt1-f169.google.com ([209.85.160.169]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MGhds-1jqpTM4Bfu-00Do1Y; Thu, 28 May 2020 11:09:31 +0200
Received: by mail-qt1-f169.google.com with SMTP id j32so6687511qte.10;
 Thu, 28 May 2020 02:09:29 -0700 (PDT)
X-Gm-Message-State: AOAM531ZckDf+1kJ/gxkWCd2TbySgD1KgU8746k9/qwuKp2dSFw6u495
 +rBBFiqHpW7c+bqtM9renkzbODeqTnOH1G/ZiH8=
X-Google-Smtp-Source: ABdhPJw0lPr/TwhrVNC3iy5YtxH6Hjy8bzmX2rAe1KGmP7eYz/oL6ngiwKPu38ETWEqiMphjY7bZ3Eseev3rSciH8pY=
X-Received: by 2002:ac8:6a09:: with SMTP id t9mr2005129qtr.7.1590656968528;
 Thu, 28 May 2020 02:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200527134254.854672-1-arnd@arndb.de>
 <CAKb7Uvhh2JKck524D9S14uNSLykFj+U48AgR+sd2uwchsH_wEQ@mail.gmail.com>
 <CAK8P3a3kRP6Sg-An5szsN=4Pv1OsG+-YQYa1wgxJCi1c+uedPw@mail.gmail.com>
 <CAPM=9tw_D0edbF38iFSrecDM8gnK4wNCDGiL2JV86tSUAmSk6g@mail.gmail.com>
In-Reply-To: <CAPM=9tw_D0edbF38iFSrecDM8gnK4wNCDGiL2JV86tSUAmSk6g@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 May 2020 11:09:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3wuK9hHWCypF0HEzWY_iSn1SQJ22j26ykXYeVYYqKpCg@mail.gmail.com>
Message-ID: <CAK8P3a3wuK9hHWCypF0HEzWY_iSn1SQJ22j26ykXYeVYYqKpCg@mail.gmail.com>
To: Dave Airlie <airlied@gmail.com>
X-Provags-ID: V03:K1:+m3ukmoA1ks/niOL9hBvbGQ8a1cq/CDwTe+9K4T9isRbNoC9Nnn
 i0dqCCiverb0ay5guh+7xAc+JPFc3i3OHyBO/pG1Hb4t3YuHAC8hu6knV9gqL6irC957St2
 Fxk5tY24hlWYJys6kyXJxTI5Ci95Hog1DR6CjScN/Tff2O+KPK/0uozYdvc3bHGIEm7WP8p
 d1Ph0cuTZEarP2cuVpHeg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+qqoRo8R2hM=:KJuhCRJR6FkhQiCT589jnN
 WhjTmV6m3UmpAcD7ted+ygYMIMqg4jkTh3/sgSjTt0zvPV1X8NwfvtXKaH2/lav9Gf6lIdw2L
 xvbcmC8B1fKr8IR3Tc9yhuJDKRAoQvglbsQa9yQPn+f2LKn4q8WeB1srtcT9JzSG0mfOdhwDJ
 NVXNG54qmiGHZPp8Dqcz0ZyPx+v1LksWd8MZJUvKrvd3I21x+VZjb6GtlXJCcrpI/S++U/5X9
 y7PnqlXWdaoG1GnY9HVv1DfoO8Ha+y7LV9UyO2KArboDHAXUZN7lsKcdnInbnJkTKI4/cDWxh
 x+Kbf5j0eT2WNyZZmsIk9BxIpdrs42wv1UrSpOfQJbv/HaFF//PADTanGXLbwH+72gKZ3TWV/
 bM7XRGlqQ9SiDhQzUC9p/9e8+X0pzNZGzAXPnfg2lVVcj+5m7jDrQNPzaWliiJG+1FE52ORPi
 W0kWu93/lxfkPjpEBd63qlONvSmCzKrkg7ZTOmZpQrndFyM7YvIqLblHu+EkDfKhhVKDqrTTN
 fkjrPZFVGH889Fwk4YtUBbOQIDKXf8ISDnPAA6fqPNmW9FnJvo1Q6ILwpPaclCK86jQBCMi45
 0aEhnLQQpQP+HBH6G/gy0wS64FUgJFWmuQzDch88zxwmrO3Yo52Vg3ePj+XAfhdXRUBmV+Z4M
 HJi0qUcPfS9Zy3DwAujPsHDENqWo5dgeT2Bo97LU4aCZ5JxjuyjiIBcnHeiMG0B5UxUBeAPRE
 2N0mXttfJMkK36ig+sBciJvzqj6nuTVz8XzeptQMj+vwuM+jU6DtEmapX0AVWUaArBUnkoqiy
 HznFBHju9O63rFu5x6TpFHH5c4hla+IWetOxAAi4RYCGXcqEb4=
Subject: Re: [Nouveau] [PATCH] nouveau: add fbdev dependency
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, May 28, 2020 at 7:37 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Thu, 28 May 2020 at 00:36, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Wed, May 27, 2020 at 4:05 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > >
> > > Isn't this already fixed by
> > >
> > > https://cgit.freedesktop.org/drm/drm/commit/?id=7dbbdd37f2ae7dd4175ba3f86f4335c463b18403
> >
> > Ok, I see that fixes the link error, but I when I created my fix, that did
> > not seem like the correct solution because it reverts part of the original
> > patch without reverting the rest of it. Unfortunately there was no
> > changelog text in the first patch to explain why this is safe.
>
> No it doesn't, I think you missed the pci in API name.
>
> The initial behaviour doesn't use the pci version of the API, the
> replacement did, and the fix used the drm wrapper around the pci one.
>
> So this patch isn't necessary now that I've fixed it the other way,

Ok, got it, thanks for explaining!

       Arnd
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
