//
//  LinksTableController.m
//  audio_book
//
//  Created by Leonid Minderov on 23.07.13.
//
//

#import "LinksTableController.h"
#import "MyCell.h"

@interface LinksTableController ()

@end

@implementation LinksTableController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Список источников";
    self.tableView.separatorColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sep"]];
    [self.tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_right_menu"]]];

    links = [[NSMutableArray alloc] initWithObjects:
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             @"http://constitution.ru",
             @"http://arbitr.ru",
             @"http://supcourt.ru",
             @"http://council.gov.ru",
             @"http://duma.gov.ru",
             @"http://government.ru",
             @"http://kremlin.ru",
             @"http://flag.kremlin.ru",
             
             
            @"http://bus.gov.ru",@"http://maps.rosreestr.ru",@"http://ved.gov.ru",@"http://zakupki.gov.ru",@"http://pravo.gov.ru",@"http://ideas.economy.gov.ru",@"http://veche.duma.gov.ru",@"http://gosuslugi.ru",@"http://minpromtorg.gov.ru",@"http://gks.ru",@"http://fsoz.gov.ru",@"http://rospotrebnadzor.ru",@"http://fms.gov.ru",@"http://gosnadzor.ru",@"http://fsrar.ru",@"http://rosgranitsa.ru",@"http://federalspace.ru",@"http://ffms.ru",@"http://fstrf.ru",@"http://customs.ru",@"http://fas.gov.ru",@"http://rosmintrud.ru",@"http://minenergo.gov.ru",@"http://economy.gov.ru",@"http://pfrf.ru",@"http://nalog.ru",@"http://minfin.ru",@"http://mintrans.ru",@"http://minsport.gov.ru",@"http://gosstroy.gov.ru",@"http://minregion.ru",@"http://rossvyaz.ru",@"http://fapmc.ru",@"http://rsoc.ru",@"http://minsvyaz.ru",@"http://meteorf.ru",@"http://mnr.gov.ru",@"http://mon.gov.ru",@"http://mkrf.ru",@"http://rosminzdrav.ru",@"http://fedsfm.ru",@"http://udprf.ru",@"http://fskn.gov.ru",@"http://fso.gov.ru",@"http://svr.gov.ru",@"http://fsb.ru",@"http://fssprus.ru",@"http://minjust.ru",@"http://mil.ru",@"http://mid.ru",@"http://mchs.gov.ru",@"http://mvd.ru",@"http://gov.ru",@"http://ombudsmanrf.org",@"http://genproc.gov.ru",@"http://ach.gov.ru",@"http://cikrf.ru",@"http://scrf.gov.ru",
              @"http://zapret-info.gov.ru",
                                                    nil];
    
    
    resourseName = [[NSMutableArray alloc] initWithObjects:
                    
                    
                    
                   
                   
                                      
                   
                    
                    
                    @"Конституция Российской Федерации",
                     @"Высший Арбитражный Суд Российской Федерации",
                     @"Верховный Суд Российской Федерации",
                    @"Совет Федерации Федерального Собрания Российской Федерации",
                     @"Государственная Дума",
                     @"Правительство Российской Федерации",
                    @"Президент Российской федерации",
                    @"Государственные символы России (флаг, герб, гимн)",

                   
                    @"Официальный сайт Российской Федерации для размещения информации о государственных (муниципальных) учреждениях",
                    @"Публичная кадастровая карта",
                    @"Портал внешнеэкономической информации Российской Федерации",
                    @"Официальный сайт Российской Федерации для размещения информации о заказах ",
                    @"Официальный интернет-портал правовой информации",
                    @"Дискуссионная площадка Минэкономразвития Российской Федерации",
                    @"Система общественного обсуждения законопроектов",
                    @"Портал государственных услуг Российской федерации",
                    @"Министерство промышленности и торговли Российской федерации",
                    @"Федеральная служба государственной статистики",
                    @"Федеральная служба по оборонному заказу ",
                    @"Федеральная служба по надзору в сфере защиты прав потребителей и благополучия человека ",
                    @"Федеральная миграционная служба",
                    @"Федеральная служба по экологическому, технологическому и атомному надзору",
                    @"Федеральная служба по регулированию алкогольного рынка",
                    @"Федеральное агентство по обустройству государственной границы Российской федерации",
                    @"Федеральное космическое агентство",
                    @"Федеральная служба по финансовым рынкам",
                    @"Федеральная служба по тарифам",
                    @"Федеральная таможенная служба",
                    @"Федеральная антимонопольная служба",
                    @"Министерство труда и социальной защиты Российской Федерации",
                    @"Министерство энергетики Российской Федерации",
                    @"Министерство экономического развития Российской Федерации",
                    @"Пенсионный фонд Российской Федерации",
                    @"Федеральная налоговая служба",
                    @"Министерство финансов Российской Федерации",
                    @"Министерство транспорта Российской Федерации",
                    @"Министерство спорта Российской Федерации",
                    @"Федеральное агентство по строительству и жилищно-коммунальному хозяйству ",
                    @"Министерство регионального развития Российской Федерации",
                    @"Федеральное агентство связи",
                    @"Федеральное агентство по печати и массовым коммуникациям",
                    @"Федеральная служба по надзору в сфере связи, информационных технологий и массовых коммуникаций",
                    @"Министерство связи и массовых коммуникаций Российской Федерации",
                    @"Федеральная служба по гидрометеорологии и мониторингу окружающей среды",
                    @"Министерство природных ресурсов и экологии Российской Федерации",
                    @"Министерство образования и науки Российской Федерации",
                    @"Министерство культуры Российской Федерации",
                    @"Министерство здравоохранения Российской Федерации",
                    @"Федеральная служба по финансовому мониторингу ",
                    @"Управление делами Президента Российской Федерации",
                    @"Федеральная служба России по контролю за оборотом наркотиков ",
                    @"Федеральная служба охраны Российской Федерации ",
                    @"Служба внешней разведки Российской Федерации",
                    @"Федеральная служба безопасности Российской Федерации",
                    @"Федеральная служба судебных приставов",
                    @"Министерство юстиции Российской Федерации",
                    @"Министерство обороны Российской Федерации",
                    @"Министерство иностранных дел Российской Федерации",
                    @"МЧС Российской Федерации",
                    @"Министерство внутренних дел Российской Федерации",
                    @"Сервер органов государственной власти России",
                    @"Уполномоченный по правам человека в Российской Федерации",
                    @"Генеральная прокуратура РФ",
                    @"Счетная палата Российской Федерации",
                    @"Центральная избирательная комиссия Российской Федерации",
                    @"Совет Безопасности Российской Федерации",
                    
                    
                     @"Единый реестр сайтов, содержащих информацию, распространение которой в Российской Федерации запрещено",
             nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [links count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"myCell";
    myCell *cell = (myCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        //Создание ячейки
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"myCell" owner:nil options:nil];
        
        
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[myCell class]])
            {
                cell = (myCell *)currentObject;
            }
        }
        
        // cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    
    //    UILabel *myTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(27, 0, 250, 44)];
    CGRect frame = CGRectMake(27, 0, 250, 44);
    cell.myTextLabel.frame = frame;
    cell.myTextLabel.text = [resourseName objectAtIndex:indexPath.row];
    
    
    cell.myTextLabel.numberOfLines = 0;
    cell.myTextLabel.font = [UIFont fontWithName:@"Helvetica" size:(14.0)];
    cell.myTextLabel.lineBreakMode = UILineBreakModeWordWrap;
    cell.myTextLabel.textAlignment = UITextAlignmentLeft;
    
    cell.myTextLabel.backgroundColor = [UIColor clearColor];
    
    cell.myTextLabel.numberOfLines = 2;
    cell.myTextLabel.textColor = [self colorWithHexString:@"0b144b"];
    cell.myTextLabel.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.34];
    cell.myTextLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
    //    cell.myTextLabel.font = [UIFont systemFontOfSize:14.0];
    cell.myTextLabel.highlightedTextColor = [self colorWithHexString:@"0b144b"];
    
    
    
    
    
    
    
    
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"currentCell"]];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_right_menu"]];
    
    
    
    
    
    
    return cell;
}


- (UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if ([segue.identifier isEqualToString:@"toBrowser"])
//    {
//        NSLog(@"wprking!");
//        //  NSLog(@"%@",self.conteiner);
//       // NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        UIViewController *vc = [segue destinationViewController];
//       // vc.object = [self.conteiner objectAtIndex:indexPath.row];
//    }
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BrowserController *a = [[BrowserController alloc] init];
    a.stringURL = [links objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:a animated:YES];
   // NSLog(@"%@!",[links objectAtIndex:indexPath.row]);
   // [[UIApplication sharedApplication] openURL:[NSURL URLWithString: [links objectAtIndex:indexPath.row]]];
}

@end
