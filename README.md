<!-- Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices -->

## dbt & snowflake
snowflakeとdbtを連携するHandsonを実施

## 開発環境
* Legoliss_Evaluationで作成したsnowflake環境へ構築
* dbtへの接続はPartnerConnectを利用して接続

#### login情報
* githubでLogin認証を行う

## 参考資料
[Handson](https://dev.classmethod.jp/articles/accelerating-data-teams-with-dbt-and-snowflake-part1/)
[dbt_directory_参考資料](https://qiita.com/Ayumu-y/items/62eae09affba5b9a4f71)

## dbt
* マクロは**Jinja**というPythonベースのテンプレート言語で書かれている
* デフォルトでは、すべての dbt モデルはビューとして実体化
* dbt はステージング フォルダー内のすべてのモデルをビューとして実体化
* marts フォルダー内のすべてのモデルをテーブルとして実体化
	`marts → table`
* 

##### schema名に関して
```
generate_schema_name.sqlのマクロを自身で作成しなくても、dbt_project.ymlで各modelに対してschemaパラメータが定義されていれば、デフォルトのスキーマ名の末尾にdbt_project.ymlのschemaパラメータで定義した内容が追加される
```

##### dbt実行タスクへのタグ付
