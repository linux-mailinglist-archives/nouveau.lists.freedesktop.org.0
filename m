Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF40279385
	for <lists+nouveau@lfdr.de>; Fri, 25 Sep 2020 23:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF41C6ED5D;
	Fri, 25 Sep 2020 21:27:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32526ED5D
 for <nouveau@lists.freedesktop.org>; Fri, 25 Sep 2020 21:27:55 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601069274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=eCE9IgIpBRrqzinh4uFdyHdFnL8q1y6u187qAngLgcA=;
 b=Ae4wn8p/BJmTSmiLv9Yq2WeyA0GNQq9dsA2duI9fAYoywqnKjJ5c7GAQhl7t3m7d6Xk5ES
 REIu2wE/MOAnGwZgmJKdq3tS78Q7TuKFUXHdES9iVxjr9vMZ7sE5J3dM3oCrCKVn/fCBoT
 xpdXlQxWnefnULUYkfn8dC4nZQdGoQo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-kTEwl64RMjOSL6KuRGiNiQ-1; Fri, 25 Sep 2020 17:27:44 -0400
X-MC-Unique: kTEwl64RMjOSL6KuRGiNiQ-1
Received: by mail-qk1-f199.google.com with SMTP id o28so3026384qkm.23
 for <nouveau@lists.freedesktop.org>; Fri, 25 Sep 2020 14:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=eCE9IgIpBRrqzinh4uFdyHdFnL8q1y6u187qAngLgcA=;
 b=Lhhi1k7Cm5SluzT5tGLCDcZiUNuOfCTADFmr+BajNLcALM9SWVssyKPMEeBuQ7YAss
 uDsKjLZ+9zPv8z/2dJId5vCuJD/e4V1/MeOVDjxm7ia5BAPAaFPbUiGk1Y87OoWO+HJ3
 LH6wbdXBJ4OwXSk34Pa/2ErF+isQh9XHv8SDW2tHOaOUlzZYWsCTcNf87nLgsNMGqjRw
 EdEsTkWlZjq6+P59YLz4mYPQHBkcBIJLA8fCqt/V/AO6XNRlwAYfQIAGIIIARgZyZXyU
 FnS9Ll5X297YVZUC2zwLxhlK3OyIaG6ZG4vKJDHjSXblJizsZ1N7SGva5L0C3CrW5h/B
 0ZDw==
X-Gm-Message-State: AOAM531bqtrAdV+4OF6gEkijvsqq3IiiSv3r+/TpYO5f2QXL7Mbccxuk
 Oyq0p7rK7iKqiOTywZ0Y46FhYlWylG4JoBYqShOYvDAYPk06kj8AvwKpVH1hiOOv6PDmwBa9dyn
 eiVeMHyhjyFAG5MBfTHC2IZnQtZTN7mU3ANgr2vUVEA==
X-Received: by 2002:a37:7805:: with SMTP id t5mr2005228qkc.157.1601069263072; 
 Fri, 25 Sep 2020 14:27:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRmcRtelReyh19dAZ0XYkEP+FKTJnm/L/0WMJPajleWzOVqy3LGtKMQVjdfA1iW3gz45OlXxfYW4RKflRra74=
X-Received: by 2002:a37:7805:: with SMTP id t5mr2005208qkc.157.1601069262688; 
 Fri, 25 Sep 2020 14:27:42 -0700 (PDT)
MIME-Version: 1.0
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 25 Sep 2020 23:27:31 +0200
Message-ID: <CACO55ts6hfd_v8V8_yJ45wm8MAN7TENL9pZZmijFaB3h-FrR=A@mail.gmail.com>
To: nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] Nouveau wiki migration
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

Hi everybody,

I think it's time to finally move our wiki from the old infrastructure
over to gitlab pages.

This comes with several benefits:
* full control through git over the ikiwiki pipeline (setup files,
plugins, system packages, ...)
* random users are able to create MRs against the wiki as long as they
are willing to create a gitlab account.
* possible to migrate over to a different wiki generator or mix and
match or whatever.
* no CGI stuff on the wiki as we don't use ikiwiki for the git
operations anymore

To view the migrate wiki visit this URL:
https://nouveau.pages.freedesktop.org/wiki/
the gitlab project lives here: https://gitlab.freedesktop.org/nouveau/wiki

There are a couple of changes I already made:
* convert the perl ikiwiki setup file to yaml:
https://gitlab.freedesktop.org/nouveau/wiki/-/blob/master/nouveau.yml
* reworked the setup file to throw out unused plugins and adjust
settings for gitlab
* enabled HTML5 (does change the style slightly, but also fixed some
regressions)
* pulled in external sources (from the fdo.org server)
* moved mdwn files into their own subdirectory

For now I changed everything inside one big commit:
https://gitlab.freedesktop.org/nouveau/wiki/-/commit/6f2d1669884af186863718ad827f65372a0c5c43

There are a couple of remaining issues/questions:
* the gitlab CI pipeline fails quite a bit, which could be annoying
* there is a delay between editing and changes going live (usually
below a minute though)
* should we disallow direct editing of files for project members so we
could CI the changes are still valid?

Next steps:
* verify everything still works
* fix remaining issues
* final step: point the subdomain to the new gitlab pages URL

If anybody else is interested in moving their wikis over, don't
hesitate to ask me questions or just copy whatever I did :)

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
